require './lib/patron'

RSpec.describe Patron do
  before(:all) do
    @patron = Patron.new(money: 123)
  end

  context "initializes" do
    it "with :money" do
      expect(@patron.money).to eq(123)
    end

    it "with :bet" do
      expect(@patron.bet).to eq(0)
    end
  end

  context "has the role of" do
    it "#to_s" do
      expect(@patron).to respond_to(:to_s)
    end
    
    it "#money" do
      expect(@patron).to respond_to(:money)
    end

    it "#ante_up" do
      expect(@patron). to respond_to(:ante_up)
      money_before = @patron.money
      @patron.ante_up 23
      expect(@patron.bet).to eq(23)
      expect(@patron.money).to eq(100)
    end

    it "#hand" do
      expect(@patron). to respond_to(:hand)
    end
  end
end