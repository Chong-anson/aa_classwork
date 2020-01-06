require_relative "poly_tree_node.rb"
class KnightPathFinder
    attr_reader :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos] #keep track of the positions that we have considered 
        build_move_tree
    end

    #self.root_node = treenode; root_node.value = pos # position of the node on the board 
    #self.root
    #bfs queue [pos1, pos2, pos3] 
    #To help us find paths, we will build a move tree. The values in the tree will be positions. A node is a child of another node if you can move from the parent position directly to the child position. The root node of the tree should be the knight's starting position. You will want to build on your PolyTreeNode work, using PolyTreeNode instances to represent each position.



    def build_move_tree(end_pos)
        #build entire tree
        tree = [@root_node]
        # until tree.empty?
            curr_pos = @considered_positions
            
            #root_node 
            #node(root_node) 
            #root_node.children << new_move (root_node) 
            #
        end
    end

    def self.valid_moves(pos)
        #will return the valid positions that can be played?
        result = []
        range = (0..8).to_a
        list = [[2,1],[2,-1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,2]] 
        list.each do | move | 
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
        #call valid moves.=> filtered out valid moves
        #add the positions into considered, then return the positions
        stored_moves = KnightPathFinder.valid_moves(pos)
        # !@considered_positions.include?(new_pos)
        stored_moves.select!{|move| !@considered_positions.include?(move)}
        @considered_positions += stored_moves
        stored_moves
    end


end#class