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
  VALUES = %w(rock paper scissors lizard spock)

  def initialize(choice)
    @value = choice
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
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
    @value
  end
end
class RPSGame
  WINS = 10

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @@wins = { human => 0, computer => 0 }
    @@moves = { human => [], computer => [] }
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "First to #{WINS} wins is the grand champ!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
    @@moves[human] << human.move
    @@moves[computer] << computer.move.to_s
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

  def winner?
    @@wins.values.any? { |wins| wins >= WINS }
  end

  def display_wins
    puts "Wins:"
    puts "#{human.name} : #{@@wins[human]}"
    puts "#{computer.name} : #{@@wins[computer]}\n"
  end

  def display_final_winner
    final_winner = @@wins[human] == WINS ? human : computer
    puts "The final winner is #{final_winner.name}!"
    puts "\n"
  end

  def display_all_moves
    puts "\n"

    @@moves.each_key do |player|
      puts "All #{player.name} moves:\n\n"
      @@moves[player].each_with_index do |move, round|
        puts "Round #{round + 1} : #{player.name} chose #{move}"
      end

    puts "\n"
    end
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

    display_all_moves
  end
end

RPSGame.new.play
