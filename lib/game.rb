%w{board king knight pawn queen rook bishop}.each { |file| require_relative file}

class Game
  attr_accessor :whites, :blacks

  def initialize
    @whites = Player.new($white_player, "white")
    @blacks = Player.new($black_player, "black")
  end

  def next_move
    puts "next move"
    input = gets.chomp
    next_move unless input.length.between?(2, 3)

  end
end

class Player

  attr_accessor :name, :color, :king, :queen, :l_rook, :l_knight, :l_bishop, 
  :r_rook, :r_knight, :r_bishop, :a_pawn, :b_pawn, :c_pawn, :d_pawn, :e_pawn,
  :f_pawn, :g_pawn, :h_pawn
  
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
      @a_pawn = WhitePawn.new([1,0])
      @b_pawn = WhitePawn.new([1,1])
      @c_pawn = WhitePawn.new([1,2])
      @d_pawn = WhitePawn.new([1,3])
      @e_pawn = WhitePawn.new([1,4])
      @f_pawn = WhitePawn.new([1,5])
      @g_pawn = WhitePawn.new([1,6])
      @h_pawn = WhitePawn.new([1,7])
    end
  end
end
