class Pawn 
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
