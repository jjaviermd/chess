%w{board king knight pawn queen rook bishop}.each { |file| require_relative file}
require "pry-byebug"

class Game
  attr_accessor :whites, :blacks, :current_player, :hold_player, :current_piece,
  :move, :board

  def initialize
    @board = Board.new
    @whites = Player.new($white_player, "white")
    @blacks = Player.new($black_player, "black")
    @current_player = self.whites
    @hold_player = self.blacks
    @current_piece = nil
    @move = nil
  end

  def next_move  
    puts "#{self.current_player.name} next move"
    self.move = gets.chomp
    unless valid_input?(self.move)
      puts "invalid input"
      next_move
    end
    unless current_piece_set(self.move)
      puts "that piece can`t go there"
      next_move
    end
  end

  def make_move(input)
    x = input[1].ord - 97
    y = 8 - input[2].to_i
    self.current_piece.position = [y,x]
    
    self.move = nil
  end

  def capture
    captured = self.hold_player.positions.key(self.current_piece.position)
    self.hold_player.remove_instance_variable(captured) if captured
    self.current_piece = nil
  end


  def valid_input?(input)
    valid_id = ["r", "n", "b", "q", "k", "p"]
    return false unless input.length.between?(2, 3)
    input.prepend("p") if input.length == 2
    
    return false unless valid_id.include?(input[0]) 
    return false unless input[1].between?("a", "h")
    return false unless input[2].to_i.between?(1, 8)
    return true
  end

  def can_pawn_go?(peon, y, x)
    if peon.is_a? WhitePawn
      if peon.position.first - y == 1 && x == peon.position.last && (!self.hold_player.positions.has_value?([y,x]) || !self.current_player.positions.has_value?([y,x]))
        return true
      elsif peon.position.first - y == 1 && (peon.position.last - x).abs == 1 && self.hold_player.positions.has_value?([y,x])
        return true
      elsif peon.position.first - y == 2 && x == peon.position.last && peon.position.first == 6
        return true
      else
        return false
      end

    elsif peon.is_a? BlackPawn
      if y - peon.position.first == 1 && x == peon.position.last && (!self.hold_player.positions.has_value?([y,x]) || self.current_player.positions.has_value?([y,x]))
        return true
      elsif y - peon.position.first == 1 && (peon.position.last - x).abs == 1 && self.hold_player.positions.has_value?([y,x])
        return true
      elsif y - peon.position.first == 2 && x == peon.position.last && peon.position.first == 1
        return true
      else
        return false
      end
    end
  end

  def can_rook_go?(rook, y, x)
    return false if self.current_player.positions.has_value?([y,x])

    return false unless rook.can_go?(y,x)

    if y == rook.position.first
      r = [rook.position.last,x].min+1..[rook.position.last,x].max-1
      for i in r do
        if self.hold_player.positions.has_value?([y,i]) || self.current_player.positions.has_value?([y,i])
          return false 
        end
      end
      return true
    elsif x == rook.position.last
      r = [rook.position.first, y].min+1..[rook.position.first, y].max-1
      for i in r do
        if self.hold_player.positions.has_value?([i,x]) || self.current_player.positions.has_value?([i,x])
          return false
        end
      end
      return true
    end 
  end 

  def can_knight_go?(knight, y, x)
    return false if self.current_player.positions.has_value?([y,x])
    return knight.can_go?(y,x)
  end

  def can_bishop_go?(bishop,y,x)

    return false unless bishop.can_go?(y,x) 
    return false if self.current_player.positions.has_value?([y,x])

    if bishop.position.first < y && bishop.position.last > x
      i = bishop.position.first + 1
      j = bishop.position.last - 1
      (y - bishop.position.first).times do
        if self.current_player.positions.has_value?([i,j])
          return false
          break
        end
        # return false if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
        if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
          return false
          break
        end
        i + 1
        j - 1
      end
      return true
    end

    if bishop.position.first < y && bishop.position.last < x
      i = bishop.position.first + 1
      j = bishop.position.last + 1
      (y - bishop.position.first).times do
        if self.current_player.positions.has_value?([i,j])
          return false
          break
        end
        # return false if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
        if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
          return false
          break
        end
        i + 1
        j + 1
      end
      return true
    end

  if bishop.position.first > y && bishop.position.last > x
    i = bishop.position.first - 1 
    j = bishop.position.last - 1
    (bishop.position.first - y).times do
      if self.current_player.positions.has_value?([i,j])
        return false
        break
      end
      # return false if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
      if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
        return false
        break
      end
      i - 1
      j - 1
    end
    return true
  end

  if bishop.position.first > y && bishop.position.last < x
    i = bishop.position.first - 1
    j = bishop.position.last + 1
    (bishop.position.first - y).times do
      if self.current_player.positions.has_value?([i,j])
        return false
        break
      end
      # return false if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
      if self.hold_player.positions.has_value?([i,j]) && [y,x] != [i,j]
        return false
        break
      end
      i - 1
      j + 1
    end
    return true
  end

  end  

  def can_queen_go?(queen, y, x)
    return false unless queen.can_go?(y,x)
    if y == queen.position.first || x == queen.position.last
      return can_rook_go?(queen, y, x)
    else
      return can_bishop_go?(queen, y, x)
    end
  end

  def can_king_go?(king, y, x)
    return false unless king.can_go?(y,x)
    return false if self.current_player.positions.has_value?([y,x])
    return true
  end

  def current_piece_set(input)

    x = input[1].ord - 97
    y = 8 - input[2].to_i

    case input[0]
    when "r"
      self.current_piece = [
      self.current_player.l_rook,
      self.current_player.r_rook].select{ |rook| can_rook_go?(rook,y,x)}.first
    when "n"
      self.current_piece = [
      self.current_player.l_knight,
      self.current_player.r_knight].select{ |knight| can_knight_go?(knight,y,x)}.first
    when "b"
      self.current_piece = [
      self.current_player.l_bishop,
      self.current_player.r_bishop].select { |bishop| can_bishop_go?(bishop,y,x)}.first
    when "q"
      self.current_piece = self.current_player.queen if can_queen_go?(self.current_player.queen,y,x)
    when "k"
      self.current_piece = self.current_player.king if can_king_go?(self.current_player.king,y,x)
    else
      self.current_piece = [
      self.current_player.a_pawn,
      self.current_player.b_pawn,
      self.current_player.c_pawn,
      self.current_player.d_pawn,
      self.current_player.e_pawn,
      self.current_player.f_pawn,
      self.current_player.g_pawn,
      self.current_player.h_pawn].select { |pawn| can_pawn_go?(pawn,y,x)}.first
    end
  end

  def get_icon
    if self.current_player.color == "white"
      return "\u{2654}" if self.current_piece.is_a?(King)
      return "\u{2655}" if self.current_piece.is_a?(Queen)
      return "\u{2656}" if self.current_piece.is_a?(Rook)
      return "\u{2658}" if self.current_piece.is_a?(Knight)
      return "\u{2657}" if self.current_piece.is_a?(Bishop)
      return "\u{2659}" if self.current_piece.is_a?(Pawn)
    else 
      return "\u{265A}" if self.current_piece.is_a?(King)
      return "\u{265B}" if self.current_piece.is_a?(Queen)
      return "\u{265C}" if self.current_piece.is_a?(Rook)
      return "\u{265E}" if self.current_piece.is_a?(Knight)
      return "\u{265D}" if self.current_piece.is_a?(Bishop)
      return "\u{265F}" if self.current_piece.is_a?(Pawn)
    end
  end

  def change_current_player
    if self.current_player == @whites
      self.current_player, self.hold_player = @blacks, @whites
    else self.current_player, self.hold_player  = @whites, @blacks
    end
  end
end

class Player

  attr_accessor :king, :queen, :l_rook, :l_knight, :l_bishop, 
  :r_rook, :r_knight, :r_bishop, :a_pawn, :b_pawn, :c_pawn, :d_pawn, :e_pawn,
  :f_pawn, :g_pawn, :h_pawn, :name, :color

  
  def initialize(name, color)
    @name =  name
    @color = color
    i = 0 if color == "black"
    i = 7 if color == "white"
    @l_rook = Rook.new([i,0])
    @l_knight = Knight.new([i,1])
    @l_bishop = Bishop.new([i,2])
    @queen = Queen.new([i,3])
    @king = King.new([i,4])
    @r_bishop = Bishop.new([i,5])
    @r_knight = Knight.new([i,6])
    @r_rook = Rook.new([i,7])
    if color == "white"
      @a_pawn = WhitePawn.new([6,0])
      @b_pawn = WhitePawn.new([6,1])
      @c_pawn = WhitePawn.new([6,2])
      @d_pawn = WhitePawn.new([6,3])
      @e_pawn = WhitePawn.new([6,4])
      @f_pawn = WhitePawn.new([6,5])
      @g_pawn = WhitePawn.new([6,6])
      @h_pawn = WhitePawn.new([6,7])
    end
    if color == "black"
      @a_pawn = BlackPawn.new([1,0])
      @b_pawn = BlackPawn.new([1,1])
      @c_pawn = BlackPawn.new([1,2])
      @d_pawn = BlackPawn.new([1,3])
      @e_pawn = BlackPawn.new([1,4])
      @f_pawn = BlackPawn.new([1,5])
      @g_pawn = BlackPawn.new([1,6])
      @h_pawn = BlackPawn.new([1,7])
    end
  end
  # private
  def positions
    self.instance_variables[2..-1].to_h do |piece| 
      [piece, self.instance_variable_get(piece).position]
    end
  end
end
