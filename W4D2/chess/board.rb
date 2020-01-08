require_relative "pieces/null_piece.rb" 
require_relative "queen"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    fill_board
  end

  def print 
    board.each do | row | 
      p row.join(" ") 
    end 
  end 
  
  def [](position) 
    x, y = position
    board[x][y] 
  end

  def []=(pos, val)
    x, y = pos
    board[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "no piece found at starting position" if self[start_pos].is_a?(NullPiece)
    raise "end position already occupied" unless self[end_pos].is_a?(NullPiece)

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end 

  private
  attr_reader :board

  def fill_board

    @board.map!.with_index do |row, i|
      if (0..1).include?(i) || (6..7).include?(i)
        row.map { |pos| Piece.new }
      else 
        row.map { |pos| NullPiece.new }
      end
    end
    
  end
end