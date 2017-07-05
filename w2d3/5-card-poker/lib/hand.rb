#require 'game'
require 'card'
require 'byebug'

class Hand
  attr_reader :best
  attr_accessor :current
  
  def initialize(current=[])
    @current = current
    @best = nil
  end

  def count_hash
    count = Hash.new { |h,k| h[k] = 0 }

    poker_each do |card|
      count[card.value] +=1
    end
    quantities = []

    count.each do |value, quantity|
      quantities << quantity
    end

    quantities.sort
  end

  def poker_each(&prc)
    @current.each do |card|
      prc.call(card)
    end
  end

  def straight_flush?
    return false unless flush? && straight?
    true
  end

  def four?
    count_hash == [1, 4]
  end

  def fullhouse?
    count_hash == [2, 3]
  end

  def flush?
    @current.all? do |card|
      card.suit == @current.first.suit
    end
  end

  def straight?
    values = []
    poker_each {|card| values << card.value}
    values.sort!
    return true if values.last - values.first == 4
    false
  end

  def triple?
    count_hash.include?(3)
  end

  def two_pair?
    count_hash == [1, 2, 2]
  end

  def pair?
    count_hash.include?(2)
  end

  def high?
    values = []
    poker_each {|card| values << card.value}
    poker_each {|card| return card if card.value == values.sort.last}
  end

  def evaluate
    if straight_flush?
      @best = 10
    elsif four?
      @best = 9
    elsif fullhouse?
      @best = 8
    elsif flush?
      @best = 7
    elsif straight?
      @best = 6
    elsif triple?
      @best = 5
    elsif two_pair?
      @best = 4
    elsif pair?
      @best = 3
    else
      @best = 2
    end

    nil
  end

end
