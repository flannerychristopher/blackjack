class Player
  attr_accessor :money, :bet

  def initialize(args)
    @money = args[:money]
    @bet = args[:bet] || 0
  end

  def to_s
    puts "current bet: #{@bet} --- money left: #{@money} \n"
  end

  def increase_bet(value)
    self.bet    += value
    self.money  -= value
  end

end