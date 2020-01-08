class Pawn < Piece
  def initialize(color, board, position)
    super(color, board, position)
    @symbol = "P" 
  end
end