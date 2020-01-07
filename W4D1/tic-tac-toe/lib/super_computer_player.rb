require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    tied = [] 
      considered = TicTacToeNode.new(game.board, mark)
      considered.children.each do |child|
        return child.prev_move_pos if child.winning_node?(mark)
        tied << child.prev_move_pos unless child.losing_node?(mark)
      end 
    raise "You lost!" if tied.empty? 
    tied.sample 
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
