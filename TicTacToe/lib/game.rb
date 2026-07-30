require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  public
    def turn(row, col, player)
      board.update(row, col, player) unless ['X', '0'].include?(board.format[row][col])
    end
end
