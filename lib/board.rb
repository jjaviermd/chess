%w{king knight pawn queen rook bishop}.each { |file| require_relative file}
require "pry-byebug"
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
    @w_rook = "\u{2656}"
    @w_bishop = "\u{2657}"
    @w_knight = "\u{2658}"
    @w_pawn = "\u{2659}"
 

    @b_king = "\u{265A}"
    @b_queen = "\u{265B}"
    @b_rook = "\u{265C}"
    @b_bishop = "\u{265D}"
    @b_knight = "\u{265E}"
    @b_pawn = "\u{265F}"
 

    @chess_board =[
      [@b_rook, @b_knight, @b_bishop, @b_queen, @b_king, @b_bishop, @b_knight, @b_rook],
      (@b_pawn * 8).split(""),
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      (@w_pawn * 8).split(""),
      [@w_rook, @w_knight, @w_bishop, @w_queen, @w_king, @w_bishop, @w_knight, @w_rook]
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

end
bindin pry