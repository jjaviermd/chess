class Pawn

  attr_accessor :position

  def initialize(position)
    @position = position
  end

end

class WhitePawn < Pawn
  # def can_go?(y,x)
  #   return true if self.position.first - y == 1 && x == self.position.last
  #   return true if self.position.first - y == 1 && (self.position.last - x).abs == 1
  #   return true if self.position.first - y == 2 && x == self.position.last && self.position.first == 6
  #   return false
  # end
end

class BlackPawn < Pawn
  # def can_go?(y,x)
  #   return true if y - self.position.first == 1 && x == self.position.last
  #   return true if y - self.position.first == 1 && (self.position.last - x).abs == 1
  #   return true if y - self.position.first == 2 && x == self.position.last && self.position.first == 1
  #   return false
  # end
end
