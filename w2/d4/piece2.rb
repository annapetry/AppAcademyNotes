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
    start = position
    update_pieces(position, end_pos)

    if start[0] < end_pos[0]
      to_remove_row = end_pos[0] - 1
      to_remove_col = end_pos[1] - 1
    else
      to_remove_row = start[0] - 1
      to_remove_col = start[1] - 1
    end
    puts "to remove: #{to_remove_row}, #{to_remove_col}"
    @grid[[to_remove_row, to_remove_col]] = nil
    
    true
  end
  
  def perform_moves(move_seq)
    if valid_move_seq?(move_seq)
      perform_moves!
    else
      raise InvalidMoveError.new("Can't do that!")
    end
  end
  
  def perform_moves!(move_seq)
    if move_seq.count == 1
      perform_slide?(move_seq[0]) || perform_jump?(move_seq)
    else
      move_seq.each do |pos|
        puts "in jump seq"
        unless perform_jump?(pos)
          raise InvalidMoveError.new("Can't complete move sequence")
        end
      end
    end
  end
  
  def dirs
    if self.is_a_king?
      UP.concat(DOWN)
    elsif self.color == :B
      DOWN
    else
      UP
    end
  end
  
  def valid_jumps
   direction = dirs
    
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
    puts "in valid slides"
    direction = dirs
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      puts "next square #{next_square}"
      next unless Board.on_board?(next_square)
      if @grid[next_square].nil?
        moves << next_square
      end
    end # moves array returned here
  end
  
  def valid_move_seq?(seq)
    begin
      duped_grid = @grid.deep_dup
      duped_grid[position].perform_moves!(seq)
    
    rescue InvalidMoveError => e
      puts "#{e.message}"
      return false
    end
    true
  end

end





