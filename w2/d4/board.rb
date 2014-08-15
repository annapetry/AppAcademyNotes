require './piece2'

class Board
  
  attr_accessor :grid
  
  def initialize(fill = true)
    # layout = LAYOUTS[size]
    make_board(fill)
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
  
  def empty?(pos)
    self[pos].nil?
  end
  
  def to_s
    self.grid.each do |row|
      p row
    end
  end
  
  # def move_piece(turn_color, from_pos, to_pos)
  #   begin
  #     raise InvalidMoveError.new("No piece to move!") if empty?(from_pos)
  #
  #     piece = self[from_pos]
  #     if piece.color != turn_color
  #       raise InvalidMoveError.new("Move your own piece")
  #     elsif !piece.valid_slides.include?(to_pos) || !piece.valid_jumps.include?(to_pos)
  #       raise InvalidMoveError.new("Piece can't move there")
  #     end
  #     piece.perform_moves!(to_pos)
  #   rescue InvalidMoveError => e
  #     puts "#{e.message}"
  #   end
  # end
    
    # need to rescue these exceptions in game class?


  def make_board(fill)
    @grid = Array.new(8) { Array.new(8) }
    populate_board if fill  
  end
  
  def populate_board
    [0, 2, 6].each do |row|
        [1, 3, 5, 7].each do |j|
          if row == 0 || row == 2
            @grid[row][j] = Piece.new(:B, [row,j], self)
          else
            @grid[row][j] = Piece.new(:W, [row,j], self)
          end
        end
      end
    
    [1, 5, 7].each do |row|
      [0, 2, 4, 6].each do |j|
        if row == 1
          @grid[row][j] = Piece.new(:B, [row,j], self)
        else
          @grid[row][j] = Piece.new(:W, [row,j], self)
        end
      end
    end
  end
  
  def deep_dup
    new_board = Board.new(false)

    @grid.flatten.compact.each do |piece|
      new_piece = piece.class.new(piece.color, piece.position, new_board)
      new_board.grid[piece.position[0]][piece.position[1]] = new_piece
    end

    new_board
  end
  
  def render
    print "\n"
    (0..7).each { |x| print " #{x}" }
    print "\n"
      @grid.each_index do |i|
        print "#{i} "
        (0..7).each do |j|
          print (@grid[i][j] == nil) ? "_ " : "#{@grid[i][j].color} "
        end
        print "\n"
      end
    print "\n"
  end

end
