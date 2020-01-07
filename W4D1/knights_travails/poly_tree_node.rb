class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value 
        @parent = nil 
        @children = [] 
    end 

    def parent=(new_parent)
        parent.children.delete(self) unless parent.nil?
        @parent = new_parent
        new_parent.children << self unless new_parent.nil?
     end

     def add_child(new_child)
        new_child.parent = self
     end

     def remove_child(child)
        child.parent = nil
        raise "Error" if !children.include?(child)
     end

    def dfs(target)
        return self if self.value == target 
        self.children.each do |child| 
            result = child.dfs(target)
            return result unless result.nil?
        end 
        nil
    end 

    def bfs(target)
        queue = [self]
        until queue.empty? 
            curr_node = queue.shift 
            return curr_node if curr_node.value == target 
            curr_node.children.each do |child| 
                queue << child 
            end 
        end 
        nil
    end 

    def inspect 
        value 
    end 
end

#PolyTreeClass
#parent=(new_parent) => reassigns current node's parent && remove current not from previous parent's children list (unless previous parent == nil). Will add current node to the children list of new_parent unless nil
#add_child(new_child) => assigns current node as the parent of the new child
#remove_child(child) => assigns the parent of the child to nil