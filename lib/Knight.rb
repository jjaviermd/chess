class Knight
  attr_accessor :position
  attr_reader :moves

  def initialize(position) #[y,x]
    @position = position
    @moves = [[1,2], [-1,-2], [1,-2], [-1,2], [2,-1], [2, 1], [-2, 1], [-2, -1]].freeze
  end

  def move_to(y,x)
    current_move = [self.position[0] - y, self.position[1] - x]
    if self.moves.include?(current_move)
      puts "Allowed"
    else puts "not Allowed"
    end
  end

end
