require 'byebug'
require './board'

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    @round = 1
    @game_over = false
  end

  def draw_board
    # Prints our board nicely
  end

  def ask_users_position
    puts "\n Choose a position between 1 and 9: "
    position = gets.chomp.to_i
  end

  def play
    ask_users_position
    # Ask user position
    # Updates board with users position
    # Print board
  end
end


g = Game.new
g.play
