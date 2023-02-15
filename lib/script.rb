require_relative "game"

puts "whites name?"
$white_player = gets.chomp
puts "blacks name?"
$black_player = gets.chomp
game = Game.new
6.times do
# binding pry
game.board.print_board
game.next_move
# binding pry
# binding pry
game.board.update_board(game.get_icon, game.current_piece.position, game.move)
game.make_move(game.move)
game.capture
# game.board.print_board
game.change_current_player
end
