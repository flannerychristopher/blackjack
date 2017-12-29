require './lib/player'

RSpec.describe Player do
  before(:each) do
    @player = Player.new()
  end

  context "initializes" do
    it "with an empty hand" do
      # player = Player.new()
      expect(@player.hand).to eq([])
    end
  end

  context "#scores" do
    it "a basic hand" do
      @player.hand = ['1']
      expect(@player.scores).to eq([1])
      @player.hand = %w(10 10)
      expect(@player.scores).to eq([20])
      @player.hand = %w(4 5 2)
      expect(@player.scores).to eq([11])
    end

    it "only aces" do
      @player.hand = ['A']
      expect(@player.scores).to eq([1, 11])
      @player.hand = %w(A A)
      expect(@player.scores.sort).to eq([2, 12, 22])
      @player.hand = %w(A A A)
      expect(@player.scores.sort).to eq([3, 13, 23, 33])
      @player.hand = %w(A A A A)
      expect(@player.scores.sort).to eq([4, 14, 24, 34, 44])
    end

    it "one ace and one face card" do
      @player.hand = %w(A K)
      expect(@player.scores.sort).to eq([11, 21])
      @player.hand = %w(J A)
      expect(@player.scores.sort).to eq([11, 21])
    end

    it "mixed hands" do
      @player.hand = %w(A 1 K)
      expect(@player.scores.sort).to eq([12, 22])
      @player.hand = %w(3 2 A A)
      expect(@player.scores.sort).to eq([7, 17, 27])
    end

  end

end