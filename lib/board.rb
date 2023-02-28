# %w{king knight pawn queen rook bishop}.each { |file| require_relative file}
require "pry-byebug"
class Board

  attr_accessor :chess_board
  attr_reader :b_rook, :b_knight, :b_bishop, :b_king, :b_queen, :b_pawn,
    :w_knight, :w_rook, :w_bishop, :w_king, :w_queen, :w_pawn


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
      [b_rook, b_knight, b_bishop, b_queen, b_king, b_bishop, b_knight, b_rook],
      (b_pawn * 8).split(""),
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      Array.new(8, " "),
      (w_pawn * 8).split(""),
      [w_rook, w_knight, w_bishop, w_queen, w_king, w_bishop, w_knight, w_rook]
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

   def update_board(piece, pos, dest)
    self.chess_board[8 - dest[2].to_i][dest[1].ord - 97] = piece
    self.chess_board[pos.first][pos.last] = " "
   end

end
