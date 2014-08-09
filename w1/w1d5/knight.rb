require "./00_tree_node.rb"

class KnightPathFinder
  
  attr_reader :visited_positions, :move_tree
  
  def initialize(position)
    @move_tree = PolyTreeNode.new(position)
    # @start = position
    # @move_tree.build_move_tree(@start) # not built yet
    @visited_positions = [position]
    build_move_tree
  end
  
  
  
  
  ###### UGLY, but it works!  REFACTOR sometime!
  
  def valid_moves(position)
    start_x, start_y = position
    results = []

    # L, e.g.
    # 1..
    # ...
    # .2.
    [1, -1].each do |x_move|
      next unless (start_x + x_move).between?(0, 7)
      [2, -2].each do |y_move|
        next unless (start_y + y_move).between?(0, 7)
        # we have a valid move!
        results << [(start_x + x_move), (start_y + y_move)]
      end # inner loop for y
    end # inner loop for x
    
    # 90 rotated L. e.g.
    # 1..
    # ..2   
    [2, -2].each do |x_move|
      next unless (start_x + x_move).between?(0, 7)
      [1, -1].each do |y_move|
        next unless (start_y + y_move).between?(0, 7)
        # we have a valid move!
        results << [(start_x + x_move), (start_y + y_move)]
      end # inner loop for y
    end # inner loop for x
    # puts "results in valid moves #{results}"
    results
  end # /valid_moves
  
  def new_move_positions(position)
    results = []
    # puts "position in new_moves_poition #{position}"
    valid_moves(position).each do |moves|
      # puts "@visited_positions in new_moves_position #{@visited_positions}"
      next if @visited_positions.include? moves
      results << moves
    end
    @visited_positions.concat(results)
    results    
  end
  
  def build_move_tree
    # model: def bfs(value)
    # this is iterative. from morning lecture. 
    queue = [@move_tree]
    until queue.empty?
      current_node = queue.shift
      #unneeded - return current_node if current_node.value == value
      # queue.concat(current_node.children)
      new_move_positions(current_node.value).each do |move|
        child = PolyTreeNode.new(move)
        current_node.add_child(child)
        queue << child
      end
    end
    nil # not found
      # end # /bfs
  end
  
  def find_path(end_pos)
    # target_node = DFS, search for end_pos
    target_node = @move_tree.bfs(end_pos)
    @move_tree.trace_path_back(target_node)
  end
  
end # /KnightPathFinder

class PolyTreeNode
  def trace_path_back(node)
    # given a node, trace it back to the root, using parent. 
    return [self.value] if node.parent.nil? 
    up = trace_path_back(node.parent)
    return up + [node.value]
  end
end

def testing
  kpf = KnightPathFinder.new([0, 0])
  
  # puts "valid moves from 3, 5"
  # p KnightPathFinder.valid_moves([3, 5])
  
  # puts "valid moves from 1, 2"
  # p KnightPathFinder.valid_moves([1, 2])
  
  # puts "checking new move positions.[3,5]"
  #   p kpf.new_move_positions([3, 5])
  #
  #   puts "checking new move positions.[6,2]"
  #   p kpf.new_move_positions([6, 2])
  
  p kpf.find_path([7, 6])  
  
  
end

testing