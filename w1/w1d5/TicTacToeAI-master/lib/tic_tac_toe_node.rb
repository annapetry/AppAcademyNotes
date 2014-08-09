require_relative 'tic_tac_toe'

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    puts "board: "
    p board
    puts "and that was board."
    
    board_states = []
    # row 0...3
      # col 0...3
        # dup board.
        # put approp mark down. 
        # check for winner. main return value? 
        # switch sides, and call children again on that board.
        # if child returns win, return loss, and vice versa. or a draw. ?
    # (0..2).each do |row|
    board.rows.each do |row|
      puts "row: "
      p row
      (0..2).each do |col|
        puts "inner loop..."
        puts "row col board: #{row} #{col} #{board} ..."
        # next unless @board[row, col].empty?
        duped = @board.dup
        duped[row, col] = @next_mover_mark
        p duped
        puts "that was duped."
        board_states.concat(duped)
      end
    end
    board_states
    
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end
end
