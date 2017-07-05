class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    total = 0

    self.cards.each do |card|
      begin
        total += card.blackjack_value
      rescue
        # if total + 11 > 21
          total += 1
        # else
        #   total += 11
        # end

        # if total + 11 > 21
        #   total += 1
        # else
        #   total += 11
        # end
      end
    end

    total
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    top_card = deck.take(1)
    self.cards.concat(top_card)
    [top_card]
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
