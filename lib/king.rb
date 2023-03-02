require 'shale'

class King < Shale::Mapper
  attribute :position, Shale::Type::Integer, collection: true
  attribute :color, Shale::Type::String
  attribute :moves, Shale::Type::Integer, collection: true

  attr_accessor :position, :color
  attr_reader :moves

  def initialize(position, color)
    @position = position
    @color = color
    @moves = [[1,0],[1,-1],[1,1],[-1,0],[-1,-1],[1,1],[0,1],[0,-1],[-1,1]].freeze
  end

  def can_go?(y,x)
    dif = [self.position.first - y, self.position.last - x]
    return true if self.moves.include?(dif)
    return false
  end
end
