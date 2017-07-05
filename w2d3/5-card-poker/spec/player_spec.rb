require 'player'
require 'hand'

describe Player do
  let(:hand) { Hand.new([Card.new(14, :s, "A"), Card.new(13, :s, "K"), Card.new(12, :s, "Q"), Card.new(11, :s, "J"), Card.new(10, :s, "10")]) }
  subject(:player) { Player.new(hand, 1000) }

  describe "#initialize" do
    it "should receive hand" do
      expect(player.hand).to_not eq(nil)
    end

    it "should receive pot" do
      expect(player.pot).to_not eq(nil)
    end
  end

  describe "#discard" do
    it "discards two cards" do
      player.discard([0, 1])
      expect(player.hand.current).to include(nil)
    end
  end

  describe "#raise" do
    it "accepts a valid raise" do
      player.raise(900)
      expect(player.current_bet).to eq(900)
    end

    it "removes money from pot" do
      player.raise(900)
      expect(player.pot).to eq(100)
    end
  end

  describe "#check" do
    it "makes current_bet 0" do
      player.check
      expect(player.current_bet).to eq(0)
    end
  end
end
