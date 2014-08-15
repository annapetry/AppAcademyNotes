require './board'

class Piece
  
  attr_accessor :king, :position
  attr_reader :color
  
  def initialize(color, position, board)
    @king = false
    @color, @position, @grid = color, position, board
  end


  
  

end

# board = Board.new
#
# board[[0, 0]] = Piece.new(:B, [0, 0], board)
