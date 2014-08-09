class PolyTreeNode
  
  # attr_accessor :children
  attr_reader :value, :parent, :children
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  
  def parent=(new_parent)
    # delete from old parent
    @parent.children.delete(self) if @parent
    @parent = new_parent
    return true if new_parent.nil? 
    # add node to the parent's children.
    new_parent.children << self unless new_parent.children.include? self
  end
  
  def add_child(new_child)
    new_child.parent = self
  end
  
  def remove_child(old_child)
    raise unless @children.include? old_child
    # @children.delete(old_child)
    old_child.parent = nil
  end
  
  def dfs(value)
    # this is recursive. from morning lecture. 
    return self if self.value == value
    @children.each do |child|
      result = child.dfs(value)
      return result if result
    end
    # not found
    nil
  end # /dfs
  
  def bfs(value)
    # this is iterative. from morning lecture. 
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == value
      queue.concat(current_node.children)
    end
    nil # not found
  end # /bfs
    
end