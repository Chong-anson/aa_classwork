require_relative "card"
#COLOR = {red : [:diamond, :heart], black : [:spade, :club]}

class Deck
  attr_reader :cards  

  def initialize
    @cards = [] 
    self.make_deck
    # self.shuffle!
  end 

  def length 
    
    @cards.length 
  end    

  def make_deck 
    COLOR.each do |curr_color, suits| 
      suits.each do |curr_suit|
        (1..13).each do |curr_val| 
          @cards << Card.new(curr_suit, curr_val, curr_color)
        end 
      end 
    end 
    nil
  end 

  # def shuffle!
  #   @cards.shuffle
  # end 


end 