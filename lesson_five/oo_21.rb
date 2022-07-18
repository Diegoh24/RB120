module Hand
  def show_hand
    puts "#{name} cards : #{hand.map(&:name).join(', ')}"
  end

  def show_draw
    puts ""
    puts "You drew a : #{hand.last.value}"
  end

  def show_total
    puts "#{name} total: #{cards_sum}"
  end

  def cards_sum
    aces, other_cards = hand.partition { |card| card.name == 'ace' }
    sum = other_cards.map(&:value).sum

    aces.each { |ace| sum += ace.value > 21 ? 1 : 11 }
    sum
  end

  def busted?
    cards_sum > 21
  end
end

class Participant
  include Hand

  def initialize
    @hand = []
    @name = set_name
  end

  attr_reader :hand, :name

  def deal(cards)
    @hand += cards
  end

  def hit(card)
    @hand << card
  end

  def reset_hand
    @hand = []
  end
end

class Player < Participant
  def set_name
    loop do
      puts "Enter a name: "
      name = gets.chomp
      return name if !name.empty?
      puts "Sorry, enter a name..."
    end
  end
end

class Dealer < Participant
  NAMES = ['stallion', 'R2D2', 'Spock', 'son']

  def set_name
    NAMES.sample
  end
end

class Deck
  SUITS = %w(hearts spades diamonds clubs)
  CARDS = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)

  def initialize
    @cards = {}
    set_deck
  end

  def deal
    @cards[SUITS.sample].shuffle!.pop
  end

  def initial_deal
    cards = []
    2.times { cards << @cards[SUITS.sample].shuffle!.pop }
    cards
  end

  def set_deck
    SUITS.each do |suit|
      @cards[suit] = []
      CARDS.each { |card| @cards[suit] << Card.new(card) }
    end
  end
end

class Card
  VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)

  attr_reader :name, :value

  def initialize(name)
    @name = name
    @value = card_value
  end

  def card_value
    if name.to_i.to_s == name
      name.to_i
    else
      name == 'ace' ? 11 : 10
    end
  end
end

class Game
  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
  end

  attr_reader :dealer, :player, :deck

  def start
    display_welcome_message
    loop do
      round_of_21
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts ""
    puts "Welcome to 21!"
    puts ""
  end

  def display_goodbye_message
    puts ""
    puts "Thanks for playing!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if %(y n).include? answer
      puts "Please enter y or n"
    end
    answer == 'y'
  end

  def round_of_21
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn unless bust?
    show_result
  end

  def reset
    deck.set_deck
    player.reset_hand
    dealer.reset_hand
  end

  def deal_cards
    player.deal(deck.initial_deal)
    dealer.deal(deck.initial_deal)
  end

  def hit_or_stay
    loop do
      status = gets.chomp.downcase
      return status if %w(hit stay).include? status
      puts "Invalid choice, please enter 'hit' or stay'."
    end
  end

  def player_turn
    loop do
      puts ""
      puts "Would you like to hit or stay?"

      hit_or_stay == 'hit' ? player.hit(deck.deal) : break
      show_player_hand
      break if player.busted?
    end
  end

  def show_player_hand
    system 'clear'
    player.show_draw
    puts ""
    player.show_hand
    player.show_total
    puts ""
  end

  def show_hands
    player.show_hand
    player.show_total
    puts ""
    dealer.show_hand
    dealer.show_total
  end

  def dealer_turn
    while dealer.cards_sum < 17
      dealer.hit(deck.deal)
    end
  end

  def bust?
    player.busted? || dealer.busted?
  end

  def tie?
    player.cards_sum == dealer.cards_sum
  end

  def winner
    if bust?
      player.busted? ? dealer : player
    else
      player.cards_sum > dealer.cards_sum ? player : dealer
    end
  end

  def show_result
    system 'clear'
    show_hands
    puts " "
    if bust?
      puts player.busted? ? player.name + " busted!" : dealer.name + " busted!"
    end
    puts tie? ? "It's a tie!" : winner.name + " won!"
  end

  def show_initial_cards
    show_hands
  end
end

Game.new.start
