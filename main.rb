require './lib/patron'
require './lib/dealer'
require './lib/deck'
require './lib/game'

Game.new(   Dealer.new,
            Patron.new,
            Deck.new    )
