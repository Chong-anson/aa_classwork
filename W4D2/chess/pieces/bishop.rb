require_relative "sliding_piece"

class Bishop < Piece 
  def initialize(color, board, position)
    super(color, board, position)
    @symbol = "" 
  end
end