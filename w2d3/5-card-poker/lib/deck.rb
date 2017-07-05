#require 'byebug'
require_relative 'card.rb'

class Deck
  attr_reader :stack

  NAMES = {
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  def initialize
    @stack = []
    populate
    shuffle
  end

  def populate
    values = (2..14).to_a
    suits = [:s, :h, :c, :d]

    values.each do |val|
      suits.each do |suit|
        #debugger
        @stack << Card.new(val, suit, NAMES[val])
      end
    end
  end

  def shuffle
    @stack.shuffle
  end

  def inspect
    @stack
  end
end
