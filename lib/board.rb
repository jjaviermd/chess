class Board

  attr_accessor :chess_board
  attr_reader :w_king, :w_queen, :l_w_rook, :l_w_knight, :l_w_bishop, :r_w_rook,
  :r_w_knight, :r_w_bishop, :w_pawn_a, :w_pawn_b, :w_pawn_c, :w_pawn_d, :w_pawn_e,
  :w_pawn_f, :w_pawn_g, :w_pawn_h, :b_king, :b_queen, :l_b_bishop, :r_b_bishop,
  :l_b_knight, :r_b_knight, :l_b_rook, :r_w_knight, :b_pawn_a, :b_pawn_b, :b_pawn_c,
  :b_pawn_d, :b_pawn_e, :b_pawn_f, :b_pawn_g, :b_pawn_h


  def initialize
    @w_king = "\u{2654}"
    @w_queen = "\u{2655}"
    @l_w_rook = "\u{2656}"
    @r_w_rook = "\u{2656}"
    @l_w_bishop = "\u{2657}"
    @r_w_bishop = "\u{2657}"
    @l_w_knight = "\u{2658}"
    @r_w_knight = "\u{2658}"
    @w_pawn_a = "\u{2659}"
    @w_pawn_b = "\u{2659}"
    @w_pawn_c = "\u{2659}"
    @w_pawn_d = "\u{2659}"
    @w_pawn_e = "\u{2659}"
    @w_pawn_f = "\u{2659}"
    @w_pawn_g = "\u{2659}"
    @w_pawn_h = "\u{2659}" 

    @b_king = "\u{265A}"
    @b_queen = "\u{265B}"
    @l_b_rook = "\u{265C}"
    @r_b_rook = "\u{265C}"
    @l_b_bishop = "\u{265D}"
    @r_b_bishop = "\u{265D}"
    @l_b_knight = "\u{265E}"
    @r_b_knight = "\u{265E}"
    @b_pawn_a = "\u{265F}"
    @b_pawn_b = "\u{265F}"
    @b_pawn_c = "\u{265F}"
    @b_pawn_d = "\u{265F}"
    @b_pawn_e = "\u{265F}"
    @b_pawn_f = "\u{265F}"
    @b_pawn_g = "\u{265F}"
    @b_pawn_h = "\u{265F}" 

    @chess_board =[
      [@l_b_rook, @l_b_knight, @l_b_bishop, @b_queen, @b_king, @r_b_bishop, @r_b_knight, @r_b_rook],
      [@b_pawn_a, @b_pawn_b, @b_pawn_c, @b_pawn_d, @b_pawn_e, @b_pawn_f, @b_pawn_g, @b_pawn_h],
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      [@w_pawn_a, @w_pawn_b, @w_pawn_c, @w_pawn_d, @w_pawn_e, @w_pawn_f, @w_pawn_g, @w_pawn_h],
      [@l_w_rook, @l_w_knight, @l_w_bishop, @w_queen, @w_king, @r_w_bishop, @r_w_knight, @r_w_rook]
    ]
  end

  def print_board
    i = 8
    puts "   A   B   C   D   E   F   G   H "
    chess_board.each do |row| 
      puts "#{i}| #{row.join(" | ")} |#{i}"
      puts "-" * 36
      i -= 1
    end
    puts "   A   B   C   D   E   F   G   H "
   end

   def update_board(piece, line, column)
    chess_board.each do |row|
      if row.include?(piece)
        row[row.index(piece)] = " "
      end
    end
    self.chess_board[line][column] = piece
   end

end

