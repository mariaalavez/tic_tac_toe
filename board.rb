require 'byebug'

class Board

  WP = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]

    def initialize
      @board = {
        1 => '1', 2 => '2', 3 => '3',
        4 => '4', 5 => '5', 6 => '6',
        7 => '7', 8 => '8', 9 => '9',
      }
    end

    def display_board
      @board
    end

    def valid_position?(position)
      allowed_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      return true if allowed_positions.include? position
    end

    def position_free?(position)
      return true if @board[position].is_a? String
    end

    def set_mark_at_board(position, mark)
      @board[position] = mark
    end

    def valid_and_free?(position)
      return true if valid_position?(position) && position_free?(position)
    end

    def iterate_through_winning_positions
      WP.each do |winning_position_array|
        a = []
        winning_position_array.each do |winning_position|
          evaluated_positions = display_board[winning_position]
          a << evaluated_positions
        end
        debugger
        return a
      end
    end

    def any_winner?(winning_position_array, mark)
      if winning_position_array.select { |p| p.to_sym != mark }.empty?
          puts "\n Player #{mark} won!!!"
          return true
      end
    end
end
