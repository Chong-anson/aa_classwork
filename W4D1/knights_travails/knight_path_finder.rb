require_relative "poly_tree_node.rb"
class KnightPathFinder
    attr_reader :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
    end

    def build_move_tree
        family = [root_node]

        until family.empty? 
            current_node = family.shift 
            current_pos = current_node.value

            new_move_positions(current_pos).each do | child_pos |
                child_node = PolyTreeNode.new(child_pos)
                family << child_node 
                current_node.add_child(child_node)
            end 
        end 

    end

    def self.valid_moves(pos)
        result = []
        range = (0..8).to_a
        list = [[2,1],[2,-1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,2]] 
        list.each do |move| 
            move_x, move_y = move 
            x,y = pos 
            new_pos = [x+move_x, y+move_y]
            if range.include?(new_pos[0]) && range.include?(new_pos[1])
                result << new_pos 
            end 
        end 
        result 
    end

    def new_move_positions(pos)
        stored_moves = KnightPathFinder.valid_moves(pos)
        stored_moves.select!{|move| !@considered_positions.include?(move)}
        @considered_positions += stored_moves
        stored_moves
    end

    def find_path(end_pos)
        target_node = root_node.bfs(end_pos)
        trace_path_back(target_node)
    end

    def trace_path_back(target_node)
        path = []
        curr_node = target_node
        until curr_node == root_node
            path.unshift(curr_node.value)
            curr_node = curr_node.parent
        end
        path.unshift(root_node.value)
        path
    end

end

#Knight_path_finder class
#valid_moves => class method that returns all moves from given postion that is within the 8 x 8 boad
#new_moves_positions(pos) => will find all the valid moves from the given position, select the moves that have already been considered, add the selected moves to the considered_moves. Then will return the array of new moves
#build_move_tree - where we left off. The method will take in a end_position/target position. Our initial high level idea was to build a tree using the @root_node as a our root node. Then use a queue to build the tree of children/parent.(can use the new_move_positions method to find the children). Once we find the end/position/target, we have found our path.