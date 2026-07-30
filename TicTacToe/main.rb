require_relative 'lib/game'

board = Board.new(3, 3)
game = Game.new(board)
player_one = Player.new("X")
player_two = Player.new("O")

loop do
  board.display
  print "#{player_one.symbol} turn ROW[0 1 2]: "
  player_one_row = Integer(gets.chomp)

  print "#{player_one.symbol} turn COLUMN[0 1 2]: "
  player_one_col = Integer(gets.chomp)

  game.turn(player_one_row, player_one_col, player_one) unless player_one_row > 2 or player_one_col > 2

  if board.winner?
    board.display
    puts "#{board.winner?} wins!"
    break
  end

  board.display
  print "#{player_two.symbol} turn ROW[0 1 2]: "
  player_two_row = Integer(gets.chomp)

  print "#{player_two.symbol} turn COLUMN[0 1 2]: "
  player_two_col = Integer(gets.chomp)

  game.turn(player_two_row, player_two_col, player_two) unless player_two_row > 2 or player_two_col > 2

  if board.winner?
    board.display
    puts "#{board.winner?} wins!"
    break
  end
end
