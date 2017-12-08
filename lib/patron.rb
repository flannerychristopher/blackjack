require_relative 'player'

class Patron < Player
  attr_accessor :money, :bet

  def initialize(args)
    super()
    @money = args[:money]
    @bet = args[:bet] || 0
  end

  def to_s
    puts "\n" + "current hand:  #{hand.join(' ')} = #{score}"
    puts "current bet:   #{@bet}"
    puts "money left:    #{@money}"
    puts "\n"
  end

  def ante_up(value)
    self.bet    += value
    self.money  -= value
  end
end
