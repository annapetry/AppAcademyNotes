require './board'

class Piece
  
  attr_accessor :king, :position
  attr_reader :color
  
  def initialize(color, position, board)
    @king = false
    @color, @position, @grid = color, position, board
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
