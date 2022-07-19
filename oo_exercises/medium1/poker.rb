class PokerHand
  def initialize(hand)
    @hand = hand.draw(5)
    @ranks = @hand.map(&:rank).map(&:to_s)
    @suits = @hand.map(&:suit)
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_reader :hand, :ranks, :suits

  def royal_flush?
    royal? && flush?
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    ranks.uniq.any? { |rank| ranks.count(rank) == 4 }
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    hand.map(&:suit).uniq.size == 1
  end

  def straight?
     @hand.min.num_value + 4 == @hand.max.num_value && ranks.uniq.size == ranks.size
  end

  def three_of_a_kind?
    ranks.any? { |rank| ranks.count(rank) == 3}
  end

  def two_pair?
    ranks.uniq.select { |rank| ranks.count(rank) == 2 }.size == 2
  end

  def pair?
    ranks.any? { |rank| ranks.count(rank) == 2}
  end

  def royal?
    ranks.sort == %w(10 Ace King Jack Queen).sort
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw(n)
    reset if @deck.empty?
    @deck.pop(n)
  end

  def reset
    @deck = SUITS.each.with_object([]) do |suit, deck|
              RANKS.each { |rank| deck << Card.new(rank, suit) }
            end

    # @deck.shuffle!
  end
end

class Card
    include Comparable
    attr_reader :rank, :suit

    RANKS = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def num_value
      rank == rank.to_i ? rank : RANKS[rank]
    end

    def <=>(other_card)
      num_value <=> other_card.num_value
    end

    def to_s
      "#{rank} of #{suit}"
    end
end

hand = PokerHand.new(Deck.new)
hand.print


# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate== 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'