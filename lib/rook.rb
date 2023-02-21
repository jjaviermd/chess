class Rook
  attr_accessor :position, :color
  
  def initialize(position, color)
    @color = color
    @position = position
  end

  def can_go?(y, x)
    if y != self.position.first && x != self.position.last 
      return false
    elsif y == self.position.first ||x == self.position.last
      return true
    end 
  end 
end
