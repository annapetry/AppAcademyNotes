require './board'

class Piece
  
  attr_accessor :king, :position
  attr_reader :color
  
  def initialize(color, position, board)
    @king = false
    @color, @position, @grid = color, position, board
  end
  
  def perform_slide(start, end_pos)
    return false unless valid_slides.include?(end_pos)
    perform_moves(end_pos)
    true
  end
  
  def perform_jump(start, end_pos)
    return false unless valid_jumps.include?(end_pos)
    perform_moves(end_pos)
    true
  end
  
  def render
    @color
  end
  
  private
  
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
  
  def deep_dup
    duped = Board.new(false)
    
    @grid.flatten.compact.each do |piece|
      new_piece = piece.class.new(piece.color, piece.position.dup, duped)
      duped.board[piece.position[0]][piece.postion[1]] = new_piece
    end
    duped
  end
  
  def is_a_king?
    @king
  end
  
  def perform_moves(end_pos)
    start = self.position 
    self.position = end_pos
    @grid[start] = nil
    @grid[end_pos] = self
    
    if can_promote?
      @king = true
    end
  end
  
  def perform_moves!(*some_moves)
    if some_moves.count > 1
      some_moves.each do |move|
        unless perform_jump(move)
          raise InvalidMoveError.new("Don't even try it")
          break
        end
      end
    else
      unless perform_slide(end_pos) || perform_jump(end_pos)
        raise InvalidMoveError.new("Don't even try it")
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
    
    direction.each_with_object([]) do |(dx, dy), moves|
      next_square = [position[0] + dx, position[1] + dy]
      break unless Board.on_board?(next_square)
      @grid[next_square].nil?
        moves << next_square
    end # moves array returned here
  end
  
  def valid_moves_seq?(end_pos)
    begin
      duped_grid = @grid.deep_dup
      duped_grid.perform_moves!(end_pos)
    rescue InvalidMoveError => e
      puts "#{e.message}"
      return false
    end
    true
  end

end

# board = Board.new
#
# board[[0, 0]] = Piece.new(:B, [0, 0], board)
