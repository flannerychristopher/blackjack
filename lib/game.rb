# dependencies: @patron.money/ante_up/hand
#               @deck.cut/deal
#               @dealer.hand

class Game
  def initialize(dealer, patron, deck, pot = 0)
    @dealer = dealer
    @patron = patron
    @players = [dealer, patron]
    @deck = deck
    @pot = pot
    post_initialize
  end

  def post_initialize
    start_game
    cut_deck
    deal 2
    show_cards
    check_for_naturals
    # p @patron, @dealer
  end

  def start_game
    print "Let's play Black Jack. How much money did you bring to the table? "
    @patron.money = gets.chomp.to_i
    print "OK, what's your starting bet? "
    starting_bet =  gets.chomp.to_i
    check_bet       starting_bet
    @patron.ante_up starting_bet
    @pot +=         starting_bet
  end

  def check_bet(bet)
    while bet > @patron.money
      print "You don't have that much money! "
      starting_bet = gets.chomp.to_i
    end
  end

  def cut_deck
    print 'Shuffling ... Please enter a number between 1 and 312 to cut the deck: '
    cut_location = gets.chomp.to_i
    until cut_location.between?(1, 312)
      print "Not a valid cut. Enter a number between 1 and 312: "
      cut_location = gets.chomp.to_i
    end
    @deck.cut cut_location
    puts "The deck has been cut."
  end

  def deal(num)
    puts "Now dealing..."
    num.times do
      @players.each { |player| player.hand << @deck.deal }
    end
  end

  def show_cards
    @players.each { |player| puts player.to_s }
  end

  def check_for_naturals
    result = "There are no naturals"
    if @dealer.hand[1].to_i == 0
      if @dealer.scores.include? 21
        result = "dealer has a natural"
      end
    end
    if @patron.scores.include? 21
      if @dealer.scores.include? 21
        result = "it's a draw"
      else
        result = "player has a natural"
      end
    end
    result
  end

end
