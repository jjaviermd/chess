class Rook
  attr_accessor :position
  def initialize(position)
    # position(y axis, x axis) is an array on to interger from 0 to 7 [n,n]
    @position = position
  end

  def move_to(y, x)

    #refactor this function later son that coordinates are always between 0 and 7.
    if y.between?(0, 7) && x.between?(0, 7)

      if y == self.position.first && x == self.position.last #destinacion == position
        #raise error destination and current position are the same
        puts "error"
      elsif y != self.position.first && x != self.position.last # non lineaer move for a rook
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


end

