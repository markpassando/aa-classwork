require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  it "has 13 of each suit" do
    count = 0
    deck.stack.each do |card|
      count += 1 if card.suit == :h
    end

    expect(count).to eq(13)
  end

  it "has 4 of each value" do
    count = 0
    deck.stack.each do |card|
      count += 1 if card.value == 2
    end

    expect(count).to eq(4)
  end

  it "has a stack of 52" do
    expect(deck.stack.length).to eq(52)
  end
end

# Deck
#deck has a stack 52
#13 of each suits
# 4 of each value
