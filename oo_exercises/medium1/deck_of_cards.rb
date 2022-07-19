class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  def reset
    @deck = SUITS.each.with_object([]) do |suit, deck|
              RANKS.each { |rank| deck << Card.new(rank, suit) }
            end

    @deck.shuffle!
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


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2