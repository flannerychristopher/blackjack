require './lib/deck'

RSpec.describe Deck do
  before(:all) do
    @deck = Deck.new
  end

  context "has a role of" do
    it "#cut" do
      expect(@deck).to respond_to(:cut)
    end

    it "#deal" do
      expect(@deck).to respond_to(:deal)
    end
  end
end