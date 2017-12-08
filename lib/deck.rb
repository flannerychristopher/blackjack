require_relative 'constants'

class Deck
  attr_accessor :cards

  def initialize
    @cards = shuffle
  end

  def shuffle
    six_decks = SINGLE_DECK * 6
    six_decks.shuffle
  end

  def cut(player_cut)
    top = cards[0..player_cut]
    bottom = cards[player_cut..cards.length]
    dealer_cut = rand(61..76)
    @cards = (bottom + top)[0..-dealer_cut]
  end

end