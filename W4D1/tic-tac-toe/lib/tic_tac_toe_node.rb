require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if board.over? && ( board.winner == evaluator || board.tied? )
    return true if board.over? && board.winner != evaluator

    if next_mover_mark != evaluator 
      children.any? do |node| 
        node.losing_node?(evaluator)
      end
    else 
      children.all? do |node| 
        node.losing_node?(evaluator)
      end
    end 

  end

  def winning_node?(evaluator)
    return true if board.over? && board.winner == evaluator 
    return false if board.over? && board.winner != evaluator

    if next_mover_mark != evaluator 
      children.all? do |node| 
        node.winning_node?(evaluator)
      end
    else 
      children.any? do |node| 
        node.winning_node?(evaluator)
      end
    end 

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_board = []
    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row,col]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          new_mark = (next_mover_mark == :x) ? :o : :x
          child_node = TicTacToeNode.new(new_board, new_mark, pos)
          children_board << child_node
        end
      end
    end
    children_board
  end

  
end
