class Bishop
  attr_accessor :position

  def initialize(position)
    # position in an array on two interger y and x (0-7)
    @position = position
    
  end

  def move_to(y,x)
    y_array =[self.position.first, y]
    x_array = [self.position.last, x]

    if y == self.position.first && x == self.position.last
      #destination an position are the same
      #raise error
      puts error
    elsif y_array.max - y_array.min == x_array.max - x_array.min
      self.position = [y,x]
    else
      puts "cell unreacheble"
    end
  end
end
