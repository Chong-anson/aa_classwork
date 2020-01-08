class Piece
  attr_accessor :position 

  def initialize(color, board, position)
    @color = color
    @board = board 
    @position = postion 
  end

  def to_s 
    "P"  
  end 

  def empty?

  end 

  def valid_moves

  end

  def symbol

  end 

  private 
  def move_into_check?(pos)
    
  end
end