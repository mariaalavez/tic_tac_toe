require 'byebug'

class TicTacToeGame

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
    @counter = 1
    @game_over = false
  end

  def position_table
    @position_table = {
      '1' => '.', '2' => '.', '3' => '.',
      '4' => '.', '5' => '.', '6' => '.',
      '7' => '.', '8' => '.', '9' => '.'
    }
  end

  def draw_board
    puts "\n  #{@position_table['1']} | #{@position_table['2']} | #{@position_table['3']}"
    puts "  --*---*---"
    puts "  #{@position_table['4']} | #{@position_table['5']} | #{@position_table['6']}"
    puts "  --*---*---"
    puts "  #{@position_table['7']} | #{@position_table['8']} | #{@position_table['9']} \n"
  end

  def ask_position
    puts "\nChoose a position between 1 and 9:"
    @position = gets.chomp.to_i
  end

  def check_position
    allowed_positions = [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
    if allowed_positions.include? @position
      @chosen_position = @position
    else
      puts "This is not a valid position"
      ask_position
    end
  end

  def check_if_position_taken
    if @position_table[ @chosen_position.to_s ] != '.'
      puts "\nThis position is taken, please choose another one except #{@chosen_position}"
    else
      choose_mark
      update_position
      iterate_through_winning_positions
    end
  end

  def choose_mark
    if @counter.odd?
      @mark = 'X'
    elsif @counter.even?
      @mark = 'O'
    end
  end

  def update_position
    @position_table[ @chosen_position.to_s] = @mark
    draw_board
    @counter += 1
  end

  def iterate_through_winning_positions
    WP.each { |wp_array|
      @a = []
      wp_array.each { |p|
        evaluated_position = @position_table[p.to_s]
        @a << evaluated_position
      }

      if @a.select{ |a| a != 'X'}.empty?
        puts "\n Player X won!"
        @game_over = true
      elsif @a.select{ |a| a != 'O'}.empty?
        puts "\n Player O won!"
        @game_over = true
      end
    }
  end

  def play
    position_table
    draw_board
    while @game_over == false
      puts "\nRound #{@counter} "
      ask_position
      check_position
      check_if_position_taken
    end
  end

end

t = TicTacToeGame.new
puts t.play
