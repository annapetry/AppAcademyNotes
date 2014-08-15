require './board'
require 'debugger'

class Piece
  
  attr_accessor :king, :position
  attr_reader :color
  
  def initialize(color, position, board)
    @king = false
    @color, @position, @grid = color, position, board
  end
  
  UP = [
    [-1, 1],
    [-1, -1]
  ]
  
  DOWN = [
    [1, 1],
    [1, -1]
  ]
 
  def can_promote?
    if self.color == :W
      return true if self.position[0] == 0
    elsif self.color == :B
      return true if self.position[0] == 7
    end
    false
  end
  
  def dirs
    if self.is_a_king?
      UP.concat(DOWN)
    elsif self.color == :B
      DOWN
    elsif self.color == :W
      UP
    end
  end
  
  def inspect
      { :pos => position,
        :color => color}.inspect
  end
  
  def is_a_king?
    @king
  end
  
  def jump_available?
    return false if valid_jumps.empty?
    true
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
    start = position
    update_pieces(position, end_pos)
    
    bigger = (start[0] < end_pos[0]) ? end_pos : start
    to_remove = [(bigger[0] - 1), (bigger[1] - 1)]
    @grid[to_remove] = nil
    
    true
  end
  
  def perform_moves(move_seq)
    if valid_move_seq?(move_seq)
      perform_moves!(move_seq)
    else
      raise InvalidMoveError.new("Can't do that!")
    end
  end
  
  def perform_moves!(move_seq)
    if move_seq.count == 1
      if valid_slides.include?(move_seq[0])
        perform_slide?(move_seq[0])
      else
        perform_jump?(move_seq[0])
      end
    else
      move_seq.each do |pos|
        puts "in jump seq"
        unless perform_jump?(pos)
          raise InvalidMoveError.new("Can't complete move sequence")
        end
      end
    end
  end
  
  def valid_jumps
   direction = dirs
   puts  "direction: #{direction}"
    
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      
      next unless Board.on_board?(next_square)
      next if @grid[next_square].nil? || @grid[next_square].color == self.color
      
        jumped_to = [next_square[0] + dx, next_square[1] + dy]        
        next unless Board.on_board?(jumped_to)
        moves << jumped_to if @grid[jumped_to].nil? && !moves.include?(jumped_to)
    end # moves array returned here
  end
  
  def valid_slides
    direction = dirs
    puts  "direction: #{direction}"
    
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      next unless Board.on_board?(next_square)
      if @grid[next_square].nil?
        moves << next_square unless moves.include?(next_square)
      end
    end # moves array returned here
  end
  
  def valid_move_seq?(seq)
    begin
      if jump_available? && !valid_jumps.include?(seq[0])
        raise InvalidMoveError.new("You must jump if a jump is available.")
      end
      duped_grid = @grid.deep_dup
      duped_grid[position].perform_moves!(seq)
    
    rescue InvalidMoveError => e
      puts "#{e.message}"
      return false
    end
    true
  end

end





