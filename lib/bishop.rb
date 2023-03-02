require 'shale'

class Bishop < Shale::Mapper
  attribute :position, Shale::Type::Integer, collection: true
  attribute :color, Shale::Type::String

  attr_accessor :position, :color

  def initialize(position, color)
    @position = position
    @color = color
  end

  def can_go?(y,x)
    return false if self.position == [y,x]

    y_array =[self.position.first, y]
    x_array = [self.position.last, x]

    if y_array.max - y_array.min == x_array.max - x_array.min
      return true
    else
      return false
    end
  end
end
