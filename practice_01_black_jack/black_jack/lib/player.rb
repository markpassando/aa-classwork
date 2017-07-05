class Player
  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    @hand = nil
  end

  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards(deck)
    self.hand.return_cards(deck)
    self.hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > self.bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt
  end
end
