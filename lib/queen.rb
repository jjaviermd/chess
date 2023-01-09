defclass Queen\
  attr_accessor :position

  def initialize(position)
    @position = position
  end
  
  def can_go?(y,x)
    # rook-like move
    if y != self.position.first && x != self.position.last 
      return false
    elsif y == self.position[0] ||x == self.position.last
      return true
    end 
  end 
  


end