require_relative 'lib/game'
require_relative 'lib/player'

colors = [ 'red', 'blue', 'green', 'yellow' ]
player = Player.new("player")
game = Game.new(colors, player)

game.start
