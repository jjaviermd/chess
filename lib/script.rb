require_relative "game"

puts "whites name?"
$white_player = gets.chomp
puts "blacks name?"
$black_player = gets.chomp
game = Game.new
game.board.print_board
10.times do
# binding pry
# binding pry
game.next_move
# binding pry
game.board.update_board(game.get_icon, game.current_piece.position, game.move)
game.make_move(game.move)
game.board.print_board
puts game.check?
puts game.mate?
# game.check if game.check?
game.capture
# game.board.print_board
game.change_current_player
end
