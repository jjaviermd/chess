require "shale"
require_relative "game"
require "yaml"
require "pry-byebug"


def save(ins)
  Dir.mkdir("saves") unless Dir.exist?("saves")
  yaml = ins.to_yaml
  file = File.open("saves/#{ins.class.to_s.downcase}.yaml", "w"){ |f| f.write yaml}
end

game_file = File.new("saves/game.yaml")
yaml = game_file.read
game = Psych.unsafe_load(yaml)


# puts "whites name?"
# $white_player = gets.chomp
# puts "blacks name?"
# $black_player = gets.chomp
# game = Game.new
# game_file = File.read("saves/game.yaml")
# game = Game.from_yaml(game_file)
game.board.print_board
1.times do
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
save(game)
binding pry
end


