require "pry-byebug"

class Rook
  attr_accessor :position
  def initialize(position)
    # position(y axis, x axis) is an array on to interger from 0 to 7 [n,n]
    @position = position
  end

  def can_go?(y, x)
    if y != self.position.first && x != self.position.last 
      return false
    elsif y == self.position[0] ||x == self.position.last
      return true
    end 
  end 
end
