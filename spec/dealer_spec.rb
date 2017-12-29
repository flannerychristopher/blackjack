require './lib/dealer'

RSpec.describe Dealer do
  before(:all) do
    @dealer = Dealer.new
  end
  
  context "has the role of" do
    it "#to_s" do
      expect(@dealer).to respond_to(:to_s)
    end
  end
end