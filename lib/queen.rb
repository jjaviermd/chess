defclass Queen\
  attr_accessor :position

  def initialize(position)
    @position = position
  end
  
  def move_to(y,x)
    
    if y != self.position.first && x != self.position.last # non lineaer move for a rook
      #raise error, a rook can't move in that direction
      puts "error"
    elsif y == self.position[0]
      @position[-1] = x
    else
      # x == self.position.last
      @position[0] = y
    end

  else
    puts "out of Boundaries"
  end
  


end