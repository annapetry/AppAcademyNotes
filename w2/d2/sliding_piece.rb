require './piece'





class SlidingPiece < Piece

  def moves(direction)
    valid_moves = []
    direction.each do |dx, dy|
      counter = 1
      loop do 
        next_square = [pos[0] + (dx * counter), pos[1] + (dy * counter)]
        break if !Board.on_board?(next_square)
        if @board[next_square].nil?
          @board[next_square]
          valid_moves << @board[next_square]
        elsif @board[next_square].color == self.color
          break
        else
          @board[next_square]
          valid_moves << @board[next_square]
          break
        end
        counter += 1
      end
    end
    valid_moves
  end
end

