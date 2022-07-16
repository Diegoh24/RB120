=begin

1. write a description of the problem and extract the major nouns and verbs

Description:
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square.
The first player to mark 3 squares in a row wins.

Nouns: player, grid, sqaure,
verbs : marking (turns), wins,

# then organize the verbs and nouns, try to pair the nouns with the verbs

player
-marks a square (turn)
-win or lose (wins?)

Board == grid
-marked by a SQUARE(noun)

Square

=end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end


  def empty_square?(key)
    @squares[key].marker == ' '
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

  def detect_winner
    WINNING_LINES.each.with_object(nil) do
      |line| return winning_marker(line) if winning_marker(line)
    end
  end

  def reset
    1.upto(9).each { |pos| @squares[pos] = Square.new }
  end

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

  private

  def winning_marker(line)
    squares = @squares.values_at(*line)
    return squares.first.marker if squares.all?(&:marked?) && same?(squares)
  end

  def same?(squares)
    squares.map(&:marker).uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    !unmarked?
  end
    #status to keep track of the mark?

end


class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end


class TTTGame

  def play
    display_welcome_message

    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset && display_play_again_message
    end

    display_goodbye_message
  end

  private

  USER_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :user, :computer, :board, :current_player

  def initialize
    @board = Board.new
    @user = Player.new(USER_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = user
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to TicTacToe!\n"
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def player_move
    loop do
        current_player_moves
        clear_screen_and_display_board if user_turn?
        break if end_game?
      end
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

  def user_turn?
    current_player == user
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
    puts "You're a #{user.marker}, computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
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
    @current_player = user
  end

  def display_play_again_message
    puts "Let's play again"
    puts ""
  end

  def current_player_moves
    if current_player == user
      user_moves
      @current_player = computer
    else
      computer_moves
      @current_player = user
    end
  end
end

game = TTTGame.new
game.play
