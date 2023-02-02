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