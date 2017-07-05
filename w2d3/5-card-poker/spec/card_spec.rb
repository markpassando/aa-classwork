require 'card'

describe Card do
  subject(:card) { Card.new(2, :s, "2") }

  describe "#initialize" do
    it "should have value" do
      expect(card.value).to eq(2)
    end

    it "should have a suit" do
      expect(card.suit).to eq(:s)
    end

    it "should have name" do
      expect(card.name).to eq("2")
    end
  end
end
