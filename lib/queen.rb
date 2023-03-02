
require 'shale'
class Queen < Shale::Mapper
  attribute :position, Shale::Type::Integer, collection: true
  attribute :color, Shale::Type::String
  
  attr_accessor :position, :color

  def initialize(position, color)
    @position = position
    @color = color
  end
  
  def can_go?(y,x)
    y_array = [self.position.first, y]
    x_array = [self.position.last, x]

    return true if y_array.max - y_array.min == x_array.max - x_array.min

    if y == self.position.first && x == self.position.last 
      return true
    elsif y == self.position[0] ||x == self.position.last
      return true
    else return false
    end
  end 
  
end
