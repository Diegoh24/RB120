class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  def initialize
    @squares = Hash.new
    reset
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
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  USER_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :user, :computer, :board

  def initialize
    @board = Board.new
    @user = Player.new(USER_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
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

  def main_game
    loop do
      display_board
      round_of_tic_tac_toe
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def round_of_tic_tac_toe
    9.times.each do |turn|
      turn.even? ? user_moves : computer_moves && clear_screen_and_display_board
      break if end_game?
    end
    clear_screen
  end

  def user_moves
    puts "Choose a square between : (#{board.unmarked_keys.join(', ')})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end
    board[square] = user.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
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

  def display_result
    display_board
    if board.winner?
      puts board.detect_winner == USER_MARKER ? "User Won!" : "Computer won!"
    else
      puts "Board is full!"
      puts "It's a tie!"
    end
  end

  def clear_screen
    system 'clear'
    puts "\n"
  end

  def end_game?
    board.winner? || board.full?
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)?"
      answer = gets.chomp.downcase

      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
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
