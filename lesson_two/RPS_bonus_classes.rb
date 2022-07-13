class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or paper:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_reader :move

  VALUES = %w(rock paper scissors lizard spock)

  def initialize(choice)
    @move = case choice
             when 'paper' then Paper.new
             when 'scissors' then Scissors.new
             when 'rock' then Rock.new
             when 'lizard' then Lizard.new
             when 'spock' then Spock.new
             end
  end

  def scissors?
    move.val == 'scissors'
  end

  def rock?
    move.val == 'rock'
  end

  def paper?
    move.val == 'paper'
  end

  def spock?
    move.val == 'spock'
  end

  def lizard?
    move.val == 'lizard'
  end

  def >(other_move)
    if rock?
      other_move.scissors? || other_move.lizard?
    elsif paper?
      other_move.rock? || other_move.spock?
    elsif scissors?
      other_move.paper? || other_move.lizard?
    elsif spock?
      other_move.scissors? || other_move.rock?
    elsif lizard?
      other_move.paper? || other_move.spock?
    end
  end

  def to_s
    move.val
  end
end

class Rock
  attr_reader :val
  def initialize
    @val = 'rock'
  end
end

class Paper
  attr_reader :val
  def initialize
    @val = 'paper'
  end
end

class Scissors
  attr_reader :val
  def initialize
    @val = 'scissors'
  end
end

class Lizard
  attr_reader :val
  def initialize
    @val = 'lizard'
  end
end

class Spock
  attr_reader :val
  def initialize
    @val = 'spock'
  end
end



class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @@wins = { human => 0, computer => 0}
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "First to 10 wins, is the grand champ!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @@wins[human] += 1
    elsif computer.move > human.move
      puts "#{computer.name} won!"
      @@wins[computer] += 1
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  # def play_again?
  #   answer = nil

  #   loop do
  #     puts "Do you want to play again? (Y/N)"
  #     answer = gets.chomp.downcase
  #     break if %(y n).include? answer
  #     puts "Sorry, must be y or n."
  #   end

  #   answer == 'y'
  # end

  def winner?
    @@wins.values.any? { |wins| wins >= 10 }
  end

  def display_wins
    puts "Wins:"
    puts "#{human.name} : #{@@wins[human]}"
    puts "#{computer.name} : #{@@wins[computer]}\n"
  end

  def display_final_winner
    final_winner = @@wins[human] == 10 ? human : computer
    puts "The final winner is #{final_winner.name}!"
    puts "\n"
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_wins
      break if winner?
    end

    display_final_winner
    display_goodbye_message
  end
end

RPSGame.new.play
