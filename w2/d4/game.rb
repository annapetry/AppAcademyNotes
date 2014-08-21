require './board'
require './exceptions'
require './piece2'

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
        game_board.render
        puts "Current player: #{color}"

        from_pos = get_pos('From pos:')
        to_pos = get_pos('To pos:')
        game_board.move(color, from_pos, to_pos)

        if @color == :B
          @color = :W
        else
          @color = :B
        end
      rescue InvalidMoveError => e
        puts "Error: #{e.message}"
        retry
      end

    end
  end

  private

  def get_pos(prompt)
    puts prompt
    gets.chomp.split(',').map { |coord_s| Integer(coord_s) }
  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play_turn
end