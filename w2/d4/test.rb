require_relative 'piece2'
require_relative 'board'
require_relative 'exceptions'
require_relative 'game'

#
# b = Board.new
#
# b.render
#
# #
# # piece2 = b[[5, 0]]
# # p piece2.perform_slide?([4, 1])
# #
# # b.render
# #
# # p piece2.perform_slide?([3, 2])
# #
# # b.render
# #
# # piece3 = b[[2, 1]]
# #
# # p piece3.perform_jump?([4, 3])
# #
# # b.render
# #
# # piece4 = b[[5, 4]]
# #
# # p piece4.perform_jump?([3, 2])
# #
# # b.render
# #
#
#
# b.move(:B, [4, 4], [3, 3])

game = Game.new

game.play_turn