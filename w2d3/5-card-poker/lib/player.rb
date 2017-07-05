class Player
  attr_accessor :hand, :pot, :in_play, :current_bet

  def initialize(hand=[]], pot=50)
    @hand = hand
    @pot = pot
    @in_play = true
    @current_bet = 0
  end

  def discard(indices)
    indices.each do |i|
      @hand.current[i] =  nil
    end
  end

  def fold
    @in_play = false
  end

  def raise(num)
    raise "Bet is more than pot" if num > @pot
    @current_bet += num
    @pot -= num
  end

  def check
    @current_bet = 0
  end
end
