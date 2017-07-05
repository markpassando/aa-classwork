require 'game'
require 'player'

describe Game do
  let(:player1) { Player.new }
  let(:player2) { Player.new }
  subject(:game) { Game.new(player1, player2)}

  describe '#initialize' do
    it 'takes array of players' do
      expect(game.players).to eq([player1, player2])
    end

    it 'generates a deck' do
      expect(game.deck).to_not eq(nil)
    end

    it 'has a total pot' do
      expect(game.total_pot).to be_a(Fixnum)
    end
  end
end
