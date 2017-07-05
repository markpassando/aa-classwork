class Card
  attr_reader :value, :suit, :name
  def initialize(value, suit, name)
    @value = value
    @suit = suit
    @name = name
  end

  def inspect
    "#{name} of #{suit} (#{self.value})"
  end
end
