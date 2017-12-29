require_relative 'player'

class Patron < Player
  attr_accessor :money, :bet

  def initialize(args = {})
    super()
    @money = args[:money] || 0
    @bet = args[:bet] || 0
  end

  def to_s
    %Q(
    current hand:  #{hand.join(' ')} = #{scores.join(' or ')}
    current bet:   #{@bet}
    money left:    #{@money}
    )
  end

  def ante_up(value)
    unless value > money
      @bet    += value
      @money  -= value
    end
  end
end
