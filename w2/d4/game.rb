class Game
  
  attr_accessor :game_board, :color
  
  def initialize
    @game_board = Board.new
    @color = :B
  end
  
  def play
    
    until won?
      begin
        
      rescue InvalidMoveError => e
        puts "#{e.message}"
        retry
      end
    end
    
    
  end
  
  def play_turn
    
    until game_board.won?
      begin
        puts game_board.render
        puts "Current player: #{color}"

        from_pos = get_pos('From pos:')
        to_pos = get_pos('To pos:')
        game_board.move(color, from_pos, to_pos)
      rescue InvalidMoveError => e
        puts "Error: #{e.message}"
        retry
      end 
      
      color == :B ? color = :W : color = :B
         
    end
  end

  private

  def get_pos(prompt)
    puts prompt
    gets.chomp.split(',').map { |coord_s| Integer(coord_s) }
  end

end