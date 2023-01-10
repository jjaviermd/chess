class King

  attr_accessor :position

  def initialize(position)
    @position = position
    @moves = [[1,0],[1,-1],[1,1],[-1,0],[-1,-1],[1,1],[0,1],[0,-1]].freeze
  end

  def can_go?(y,x)

  end
end