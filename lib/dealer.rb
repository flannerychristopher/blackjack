require_relative 'player'

class Dealer < Player
  def to_s
    dealer_hand = hand.join(' ')
    dealer_hand[0] = '?'
    "\n" + "    Dealer has:    #{dealer_hand}"
  end
end
