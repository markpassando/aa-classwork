require 'player'
require 'deck'
require 'hand'

class Game
  attr_reader :players, :total_pot, :deck

  def initialize(*players)
    @players = players
    @total_pot = nil
    @deck = Deck.new
    @current_player = players_in_play.first
    @last_bet = 0
  end

  def run
    until won?
      deal_cards
      until round_over?
        take_turn
      end
      @deck = Deck.new
    end

    "#{@players.first} wins with prize money of #{@players.pot}!"
  end

  def deal_cards
    until @players.all? { |player| player.hand.length == 5}
      @players.each do |player|
        player.hand << deck.pop
      end
    end
  end

  def take_turn
    prompt.downcase

    case prompt
    when "check"
      #call player Check
    when "raise"
      puts "How much do you want to raise?"
      amount = get.chomp.to_i
      raise "bet is smaller than"
      @current_player.raise(amount)
    when "fold"
      @current_player.fold
    end

    #case or ifels
  end

  def betting_phase

  end

  def prompt
    puts "What do you want to do? (Check, Raise, Fold)"
    move = gets.chomp
  end

  def round_over?
    @total_pot == 0
  end

  def won?
    @player.length == 1
  end

  def players_in_play
    @players.select { |player| player.in_play }
  end
end
