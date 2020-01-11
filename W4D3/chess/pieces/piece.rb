class Piece
  attr_accessor :position 
  attr_reader :color, :board 

  def initialize(color, board, position)
    @color = color      # 1 or -1 
    @board = board 
    @position = position 
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