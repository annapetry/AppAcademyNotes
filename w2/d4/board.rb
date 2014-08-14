require './piece'

class Board
  
  def initialize(filled = true)
    # layout = LAYOUTS[size]
    make_board
  end
  
  def self.on_board?(position)
    position.all? { |coord| (0..7).cover?(coord) }
  end
  
  def [](position)
    row, col = position
    @grid[row][col]
  end
  
  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end
  
  def render
    @grid.each do |row|
      puts "\n"
      row.map do |piece|
        # piece.nil? ? '.' : piece.render
        print "."
      end.join(" ")
    end
  end
    
  private

  def make_board(filled)
    @grid = Array.new(8) { Array.new(8) }
    break unless filled
  end
  
end

