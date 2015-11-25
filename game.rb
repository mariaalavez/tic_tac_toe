require 'byebug'
require 'board.b'

class Game

  def initialize
    @round = 1
    @game_over = false
    @board = Board.new
  end

  def self.play
    puts @board
  end
end


g = Game.play
