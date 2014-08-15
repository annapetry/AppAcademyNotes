require_relative 'piece'
require_relative 'board'
require_relative 'exceptions'


b = Board.new

b.render


piece2 = b[[5, 0]]
p piece2.perform_slide?([4, 1])

b.render

p piece2.perform_slide?([3, 2])

b.render

piece3 = b[[2, 1]]

p piece3.perform_jump?([4, 3])

b.render

# p piece2.perform_slide?([3, 2])
# piece = b[[2, 1]]
# piece.perform_moves([3, 2])

