require_relative "game"

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