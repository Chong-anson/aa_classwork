require_relative "all_pieces" 

require "byebug"
class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    fill_board
  end

  def print 
    grid.each do | row | 
      p row.join(" ") 
    end 
  end 
  
  def [](position) 
    x, y = position
    grid[x][y] 
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "no piece found at starting position" if self[start_pos].is_a?(NullPiece)
    raise "end position already occupied" unless self[end_pos].is_a?(NullPiece)

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end 

  def valid_pos?(position)
    position.all? { |po| (0..7).include?(po)}
  end 
  
  attr_reader :grid #moved from line 33
  private
  

  def fill_board
        grid[0] = [Rook.new(1, self, [1,0]), Knight.new(1, self, [1,1]), Bishop.new(1, self, [1,2]),
         Queen.new(1, self, [1,3]), King.new(1, self, [1,4]), Bishop.new(1, self, [1,5]), 
         Knight.new(1, self, [1,6]), Rook.new(1, self, [1,7])]
        grid[1].map!.with_index { | ele, i | Pawn.new(1, self, [1,i])}
        (2..5).each do | row | 
          grid[row].map! { NullPiece.instance }
        end 
        grid[6].map!.with_index { | ele, i | Pawn.new(-1, self, [6,i])}
        grid[7] = [Rook.new(-1, self, [7,0]), Knight.new(-1, self, [7,1]), Bishop.new(-1, self, [7,2]),
         Queen.new(-1, self, [7,3]), King.new(-1, self, [7,4]), Bishop.new(-1, self, [7,5]), 
         Knight.new(-1, self, [7,6]), Rook.new(-1, self, [7,7])] 
  end


  def inspect 
    self.print
  end 
end

$b = Board.new
$b.print 
