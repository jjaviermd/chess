%w{board king knight pawn queen rook bishop}.each { |file| require_relative file}
require "pry-byebug"

class Game
  attr_accessor :whites, :blacks, :current_player, :hold_player, :current_piece, :move

  def initialize
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
    self.current_piece = nil
    self.move = nil
  end

  def capture
    captured = self.hold_player.positions.key(self.current_piece.position)
    self.hold_player.remove_instance_variable(captured) if captured
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

  def current_piece_set(input)

    x = input[1].ord - 97
    y = 8 - input[2].to_i

    case input[0]
    when "r"
      self.current_piece = [
      self.current_player.l_rook,
      self.current_player.r_rook].select{ |rook| rook.can_go?(y,x)}.first
    when "n"
      self.current_piece = [
      self.current_player.l_knight,
      self.current_player.r_knight].select{ |knight| knight.can_go?(y,x)}.first
    when "b"
      self.current_piece = [
      self.current_player.l_bishop,
      self.current_player.r_bishop].select { |bishop| bishop.can_go?(y,x)}.first
    when "q"
      self.current_piece = self.current_player.queen if self.current_player.queen.can_go?(y,x)
    when "k"
      self.current_piece = self.current_player.king if self.current_player.king.can_go?(y,x)
    else
      self.current_piece = [
      self.current_player.a_pawn,
      self.current_player.b_pawn,
      self.current_player.c_pawn,
      self.current_player.d_pawn,
      self.current_player.e_pawn,
      self.current_player.f_pawn,
      self.current_player.g_pawn,
      self.current_player.h_pawn].select { |pawn| pawn.can_go?(y,x)}.first
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


puts "whites name?"
$white_player = gets.chomp
puts "blacks name?"
$black_player = gets.chomp
game = Game.new
# 2.times do
# game.next_move
# game.make_move(game.move)
# game.capture
# game.change_current_player
# end

binding pry
# game.make_move(game.move)