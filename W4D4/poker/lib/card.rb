COLOR = { :red => [:diamond, :heart], :black => [:spade, :club]}

class Card
  attr_reader :suit, :value, :color
  def initialize(suit, value, color)
    raise "Invalid Suit" unless COLOR.values.flatten.include?(suit)
    raise "Invalid Color" unless COLOR.keys.flatten.include?(color)
    raise "Invalid Value" unless (1..13).include?(value)
    raise "Unmatched Color" unless COLOR[color].include?(suit)

    @color = color 
    @value = value 
    @suit = suit 
  end

end