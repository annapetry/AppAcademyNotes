class Board
  MAP = {
    0 => [0][0],
    1 => [0][1],
    2 => [0][2],
    3 => [1, 0],
    4 => [1, 1],
    5 => [1, 2],
    6 => [2, 0],
    7 => [2, 1],
    8 => [2, 2]
  }
  
  attr_accessor :board
  
  def initialize
    @board = Array.new(3) { Array.new(3, '.') }
  end
  
  def display_board
    3.times { |i| print "#{@board[i]} \n"}
  end
  
  def won?
  end
  
  def winner
  end
  
  def empty?(pos)
    return true if pos.include?('.')
    false
  end
  
  def place_mark(pos, mark)
    
  end
end

class Game
  
  def initialize
  end
  
  def play
    #update board
    
    #prompt move
    
    #spot empty?
    
    #place_mark
  
    #check won?
    
  end
end

class HumanPlayer  
end

class ComputerPlayer
end