require 'byebug'
require './board'

class Game

  def initialize
    @board = Board.new
    @game_over = false
    @counter = 1
  end

  def ask_users_position
    puts "\nChoose a position between 1 and 9"
    position = gets.chomp.to_i
  end

  def draw_board
    puts "\n #{@board.display_board[1]} | #{@board.display_board[2]} |#{@board.display_board[3]}"
    puts " --*---*---"
    puts " #{@board.display_board[4]} | #{@board.display_board[5]} |#{@board.display_board[6]}"
    puts " --*---*---"
    puts " #{@board.display_board[7]} | #{@board.display_board[8]} |#{@board.display_board[9]}\n"
  end

  def select_mark_for_user
    if @counter.odd?
      :X
    elsif @counter.even?
      :O
    end
  end

  def update_board(position, mark)
    if @board.valid_and_free?(position)
      @board.set_mark_at_board(position, mark)
      draw_board
      @counter += 1
    else
      puts "\nPosition #{position} is taken, please choose another one"
    end
  end

  def play
    draw_board
    while @game_over == false
      mark = select_mark_for_user
      puts "\nROUND: #{@counter} \nPLAYER: #{mark}"
      position = ask_users_position
      # @board.valid_and_free?(position)
      # @board.valid_position?(position)
      # @board.position_free?(position, mark)

      update_board(position, mark)
      current_array = @board.iterate_through_winning_positions
      @board.any_winner?(current_array, mark)
    end
  end
end

g = Game.new
g.play
