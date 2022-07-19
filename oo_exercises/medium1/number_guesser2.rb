class GuessingGame
  def initialize(low, high)
    @range = low..high
    @guesses = Math.log2(range.size).to_i + 1
  end

  def play
    reset
    main_game
    display_result
  end

  private

  attr_reader :number_guessed, :guesses, :target_number, :range

  def reset
    @target_number = range.to_a.sample
    @number_guessed = nil
  end

  def main_game
    guesses.downto(1) do |guesses_remaining|
      display(guesses_remaining)
      choose_number

      break if winner?
      display_number_accuracy
    end
  end

  def display(guesses)
    puts "You have #{guesses} guesses remaining"
  end

  def choose_number
    number = nil
    loop do
      puts "Enter a number bween #{range.first} and #{range.last}: "
      number = gets.chomp.to_i
      break if range.include? number
      puts "please enter a valid number"
    end
    @number_guessed = number
  end

  def display_number_accuracy
    if number_guessed > target_number
      puts "Your guess is too high"
    else
      puts "Your guess is too low"
    end
  end

  def winner?
    target_number == number_guessed
  end

  def display_result
    winner? ? display_winner_message : display_loser_message
  end

  def display_loser_message
    puts "You have no more guesses. You lost!"
  end

  def display_winner_message
    puts "You won!"
  end
end

game = GuessingGame.new(501, 1500)
game.play