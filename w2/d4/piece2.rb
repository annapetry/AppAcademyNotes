require './board'

class Piece
  
  attr_accessor :king, :position
  attr_reader :color
  
  def initialize(color, position, board)
    @king = false
    @color, @position, @grid = color, position, board
  end
  
  FORWARD_BACKWARD = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]
  
  FORWARD = [
    [1, 1],
    [1, -1]
  ]
  
  def can_promote?
    if self.color == :W
      return true if self.position[0] == 9
    elsif self.color == :B
      return true if self.position[0] == 0
    end
    false
  end
  
  def inspect
      { :pos => position,
        :color => color}.inspect
  end
  
  def is_a_king?
    @king
  end
  
  def update_pieces(start, end_pos)
    @grid[start].position = end_pos
    @grid[end_pos] = @grid[start]
    @grid[start] = nil
    
    if can_promote?
      @king = true
    end
  end
  
  def perform_slide?(end_pos)
    return false unless valid_slides.include?(end_pos)
    update_pieces(position, end_pos)
    true
  end
  
  def perform_jump?(end_pos)
    return false unless valid_jumps.include?(end_pos)
    update_pieces(position, end_pos)
    
    # TODO: need to remove jumped pieces
    true
  end
  
  def perform_moves!(*move_seq)
    if move_seq.count == 1
      unless perform_slide?(move_seq)
        puts "valid_slide false"
        perform_jump?(move_seq)
      end
    else
      move_seq.each do |pos|
        unless perform_jump?(pos)
          raise InvalidMoveError.new("Can't complete move sequence")
          return
        end
      end
    end
    
  end
  
  
  def valid_jumps
    direction = self.is_a_king? ? FORWARD_BACKWARD : FORWARD
    
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      
      next unless Board.on_board?(next_square)
      next if @grid[next_square].nil? || @grid[next_square].color == self.color
      
      direction.each do |(d_x, d_y)|
        jumped_to = [next_square[0] + d_x, next_square[1] + d_y]        
        next unless Board.on_board?(jumped_to)
        moves << jumped_to if @grid[jumped_to].nil? 
      end
    end # moves array returned here
  end
  
  def valid_slides
    direction = self.is_a_king? ? FORWARD_BACKWARD : FORWARD
    puts "in valid_slides"
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      puts "next square: #{next_square}"
      next unless Board.on_board?(next_square)
      @grid[next_square].nil?
        moves << next_square
        puts "moves in valid_slides #{moves}"
    end # moves array returned here
  end
  


end

