module Printable
  def joinor(arr, delimiter = ", ", word = "or")
    if arr.size > 2
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    else
      arr.size > 1 ? arr.join(" #{word} ") : arr.first
    end
  end
end

module Winnable
  def win
    computer_lines = board.lines_one_from_win.select do |line|
      line.map {|key| board[key]}.any?(computer.marker)
    end

    if computer_lines.any?(&:any?)
      board.unmarked_keys.each do |key|
        computer_lines.first.each { |winning_key| return key if winning_key == key }
      end
    end
  end

  def defend
    board.unmarked_keys.each do |key|
      board.lines_one_from_win.first.each { |key2| return key if key2 == key }
    end
  end
end


class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  def initialize
    @squares = Hash.new
    reset
  end

  def [](key)
    @squares[key].marker
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def winner?
    !!detect_winner
  end

  def lines_one_from_win
    WINNING_LINES.select do |line|
      markers = @squares.values_at(*line).map(&:marker)
      markers.delete(Square::INITIAL_MARKER)
      markers.size == 2 && markers.uniq.size == 1
    end
  end

  def winning(line)
    sqrs = @squares.values_at(*line).map(&:marker)
    return sqrs if sqrs.uniq.size == 1 && sqrs.first != Square::INITIAL_MARKER
  end

  def detect_winner
    WINNING_LINES.each { |line| return winning(line).first if winning(line) }
    nil
  end

  def reset
    1.upto(9).each { |pos| @squares[pos] = Square.new }
  end
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  attr_accessor :marker

  INITIAL_MARKER = " "

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end

class TTTGame
  include Printable
  include Winnable

  COMPUTER_MARKER = 'O'

  attr_reader :user, :computer, :board

  def initialize
    @board = Board.new
    @user = Player.new(choose_marker, "User")
    @computer = Player.new(COMPUTER_MARKER, "Computer")
    @scores = {@user => 0, @computer => 0}
  end

  def play
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear_screen
    puts "Welcome to TicTacToe!\n"
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def choose_marker
    puts "Please choose a marker: "
    gets.chomp.upcase
  end

  def game_over?
    @scores.values.any?(5)
  end

  def main_game
    loop do
      display_board
      round_of_tic_tac_toe
      display_result

      break if game_over?
      reset
      display_play_again_message
    end
  end

  def round_of_tic_tac_toe
    9.times.each do |turn|
      turn.even? ? user_moves : computer_moves && display_board
      break if end_round?
    end
    #clear_screen
  end


  def user_moves
    puts "Choose one of the folloing squares: (#{joinor(board.unmarked_keys)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end
    board[square] = user.marker
  end

  def computer_moves
    if board.lines_one_from_win.any?(&:any?)
      win ? board[win] = computer.marker : board[defend] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def display_board
    puts "You're a #{user.marker}, computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def round_winner
     board.detect_winner == user.marker ? user : computer
  end

  def display_scores
    puts ""
    puts "SCORES: "
    puts "______________________"
    @scores.each { |player, score| puts "#{player.name} wins: #{score}" }
  end

  def display_result
    display_board
    if board.winner?
      puts "#{round_winner.name} won!"
    else
      puts "Board is full!"
      puts "It's a tie!"
    end
    display_scores
    @scores == 5 ? final_results : continue_game
  end

  def final_results
    puts ""
    puts "The final winner is #{round_winner.name}!"
  end

  def continue_game
    puts ""
    puts "Press any key to continnue"
    gets
  end

  def clear_screen
    system 'clear'
    puts "\n"
  end

  def end_round?
    board.winner? || board.full?
  end

  # def play_again?
  #   answer = nil

  #   loop do
  #     puts "Would you like to play again? (y/n)?"
  #     answer = gets.chomp.downcase

  #     break if %w(y n).include? answer
  #     puts "Sorry, must be y or n"
  #   end

  #   answer == 'y'
  # end

  def update_scores
    @scores[round_winner] += 1
  end

  def reset
    update_scores
    board.reset
    clear_screen
  end

  def display_play_again_message
    puts "Let's play again"
    puts ""
  end
end

game = TTTGame.new
game.play
