class Knight
  attr_accessor :position
  attr_reader :moves

  def initialize(position) #[y,x]
    @position = position
    @moves = [[1,2], [-1,-2], [1,-2], [-1,2], [2,-1], [2, 1], [-2, 1], [-2, -1]].freeze
  end

  def can_go?(y,x)
    current_move = [self.position[0] - y, self.position[1] - x]
    if self.moves.include?(current_move)
      return true
    else return false
    end
  end

end
