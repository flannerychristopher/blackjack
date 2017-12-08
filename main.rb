require './lib/patron'
require './lib/dealer'
require './lib/deck'

dealer = Dealer.new

print "Let's play Black Jack. How much money did you bring to the table? "
money_brought = gets.chomp.to_i
patron = Patron.new(money: money_brought)

print "OK, what's your starting bet? "
starting_bet = gets.chomp.to_i
patron.ante_up starting_bet

all_patrons = [patron, dealer]

deck = Deck.new
print 'Please enter a number between 1 and 312 to cut the deck '
cut_location = gets.chomp.to_i
deck.cut cut_location

puts "\n...now cutting the deck and dealing:"

2.times do
  all_patrons.each do |person|
    person.hand << deck.deal
  end
end

puts patron.to_s, dealer.to_s
