class PolyTreeNode
    attr_reader :parent, :children, :value
    #root, a
    def initialize(value)
        @value = value 
        @parent = nil 
        @children = [] 
    end 

    def parent=(new_parent)
        #see whether self has a parent already 
        #if yes, delete self from its parent's children list
        
        unless parent.nil?
            parent.children.delete(self)
        end 
        #new_parent = nil 
        #nil --> self.parent 
        if new_parent.nil?
            @parent = nil
        else 
            @parent = new_parent 
            new_parent.children << self if !new_parent.children.include?(self)
        end 
     end

     def add_child(child)
        child.parent=self
        #parent = self 
        # self.parent = self 
     end

     def remove_child(child)
        child.parent = nil
        # children.delete(child)
        raise "Error" if !children.include?(child)
     end

    def dfs(target)
        return self if self.value == target 
        self.children.each do |child| 
            result = child.dfs(target)
            return result if !result.nil?
        end 
        nil
    end 

    def bfs(target)
        lines = [self]
        until lines.empty? 
            first_ele = lines.shift 
            return first_ele if first_ele.value == target 
            first_ele.children.each do |child| 
                lines << child 
            end 
        end 
        nil
    end 

end#class
#[a]
#have the q start the root
#el = q.shift
#check if its equal to target, return if is
#if not will add children to the q



#inst_poly_tree.dfs

#return root if root == target
#root.children do |child|
#   dfs(child,target)
# end
# class Searchable 

# end