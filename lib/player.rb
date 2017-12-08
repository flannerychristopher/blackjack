class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def score
    @hand.reduce(0) do |sum, card|
      sum += card.to_i.zero? ? 10 : card.to_i
    end
  end
end
