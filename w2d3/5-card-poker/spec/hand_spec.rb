require 'hand.rb'
require 'card'

describe Hand do
  subject(:hand) { Hand.new }

  it "checks if straight flush" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(13, :s, "K"),
      Card.new(12, :s, "Q"),
      Card.new(11, :s, "J"),
      Card.new(10, :s, "10")
    ]
    expect(hand.straight_flush?).to be true
  end

  it "checks if four of a kind" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(14, :h, "A"),
      Card.new(14, :c, "A"),
      Card.new(14, :d, "A"),
      Card.new(10, :s, "10")
    ]
    expect(hand.four?).to be true
  end

  it "checks if full hosue" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(14, :h, "A"),
      Card.new(14, :c, "A"),
      Card.new(10, :h, "10"),
      Card.new(10, :s, "10")
    ]
    expect(hand.fullhouse?).to be true
  end

  it "checks if flush" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(13, :s, "K"),
      Card.new(11, :s, "J"),
      Card.new(9, :s, "9"),
      Card.new(10, :s, "10")
    ]
    expect(hand.flush?).to be true
  end

  it "checks if straight" do
    hand.current = [
      Card.new(2, :s, "2"),
      Card.new(3, :h, "3"),
      Card.new(4, :c, "4"),
      Card.new(5, :h, "5"),
      Card.new(6, :s, "6")
    ]
    expect(hand.straight?).to be true
  end

  it "checks if three of a kind" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(14, :h, "A"),
      Card.new(14, :c, "A"),
      Card.new(9, :d, "9"),
      Card.new(10, :s, "10")
    ]
    expect(hand.triple?).to be true
  end

  it "checks if two_pair" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(14, :h, "A"),
      Card.new(5, :c, "5"),
      Card.new(5, :d, "5"),
      Card.new(10, :s, "10")
    ]
    expect(hand.two_pair?).to be true
  end

  it "checks if pair" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(14, :h, "A"),
      Card.new(5, :c, "5"),
      Card.new(9, :d, "9"),
      Card.new(10, :s, "10")
    ]
    expect(hand.pair?).to be true
  end

  it "checks if high card" do
    hand.current = [
      Card.new(14, :s, "A"),
      Card.new(13, :h, "K"),
      Card.new(5, :c, "5"),
      Card.new(9, :d, "9"),
      Card.new(10, :s, "10")
    ]
    expect(hand.high?).to eq(hand.current[0])
  end

  describe "#hevaluate" do
    it "evaluates hand to a score" do
      hand.current = [
        Card.new(2, :s, "2"),
        Card.new(3, :h, "3"),
        Card.new(4, :c, "4"),
        Card.new(5, :h, "5"),
        Card.new(6, :s, "6")
      ]
      hand.evaluate
    expect(hand.best).to eq(6)
    end
  end
end



#straight flush
#four of a kind
#full house
#flush
#straight
#three of a kind
#two pair
#high card
