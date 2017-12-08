require './lib/player'
require './lib/deck'

puts "Let's play Black Jack. How much money did you bring to the table?"
money_brought = gets.chomp.to_i
player = Player.new(money: money_brought)

p player

puts "OK, what's your starting bet?"
starting_bet = gets.chomp.to_i
player.increase_bet starting_bet

puts player.to_s

deck = Deck.new
puts 'The six decks are shuffled, please pick a number between 1 and 312 to cut the deck'
cut_location = gets.chomp.to_i

# p deck
deck.cut cut_location

p deck.cards.length

