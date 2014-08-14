class Game
  
  def initialize(size)
    layout = LAYOUTS[size]
    @game_board = Board.new(layout[:grid_size])
  end
  
  
  
  private
  
  LAYOUTS = {
     :small => { :grid_size => 8},
     :medium => { :grid_size => 10},
     :large => { :grid_size => 12} # whoa.
   }
  
end