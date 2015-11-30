require 'byebug'

class Board

  attr_accessor :game

  def initialize
    @board = {
      1 => '.', 2 => '.', 3 => '.',
      4 => '.', 5 => '.', 6 => '.',
      7 => '.', 8 => '.', 9 => '.',
    }
  end

  def set_mark_at_position(position, mark)
    #Places a mark on the board at a given position
  end

  def look_up_for_mark_at_position(position)
    # Returns the mark at given position X, O or nil
  end

  def display_board
    # Prints the board to the terminal with no format
  end

  def valid_position?(position)
    # Returns true or false if position is an integer

    allowed_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    if allowed_positions.include? position
      @chosen_position = position
    else
      puts "This is not a valid position"
    end
  end

  def valid_move?(position)
    # REturns true or false if position is taken
  end
end
