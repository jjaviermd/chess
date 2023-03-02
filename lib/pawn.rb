require 'shale'

class Pawn < Shale::Mapper
  attribute :position, Shale::Type::Integer, collection: true
  attribute :color, Shale::Type::String

  attr_accessor :position, :color

  def initialize(position, color)
    @position = position
    @color = color
  end

end

class WhitePawn < Pawn
end

class BlackPawn < Pawn
end
