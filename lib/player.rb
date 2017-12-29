class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end  
  
  def scores(scores = [0])
    hand.each_with_index do |card, i|
      if card == 'A'  
        scores << (scores[-1] + 11)
        (0..scores.length-2).each { |i| scores[i] += 1 }
      else
        num = card.to_i.zero? ? 10 : card.to_i
        scores.map! { |s| s += num }
      end
    end
    scores
  end
  
end