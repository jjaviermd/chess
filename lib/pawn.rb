class Pawn

  attr_accessor :position

  def initialize(position)
    @position = position
  end

end

class WhitePawn < Pawn

end

class BlackPawn < Pawn

end
