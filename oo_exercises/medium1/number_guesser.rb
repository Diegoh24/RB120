class GuessingGame
  RANGE = (1..100).to_a

  def play
    reset
    main_game
    display_result
  end

  private

  attr_reader :number_guessed, :guesses, :target_number

  def reset
    @target_number = RANGE.sample
    @number_guessed = nil
  end

  def display(guesses)
    puts "You have #{guesses} guesses remaining"
  end

  def choose_number
    number = nil
    loop do
      puts "Enter a number bween 1 and 100: "
      number = gets.chomp.to_i
      break if RANGE.include? number
      puts "please enter a valid number"
    end
    @number_guessed = number
  end

  def display_number_accuracy
    if @number_guessed > target_number
      puts "Your guess is too high"
    else
      puts "Your guess is too low"
    end
  end

  def winner?
    target_number == number_guessed
  end

  def main_game
    7.downto(1) do |guesses_remaining|
      display(guesses_remaining)
      choose_number

      break if winner?
      display_number_accuracy
    end
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

game = GuessingGame.new
game.play