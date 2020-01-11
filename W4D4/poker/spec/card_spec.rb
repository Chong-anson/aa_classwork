require 'card' 

describe Card do
  describe "#initialize" do 
    it "should accept a suit, a number and a color" do
      expect{ Card.new(1)}.to raise_error(ArgumentError) 
      expect{ Card.new(:apple, 1, :black)}.to raise_error("Invalid Suit")
      expect{ Card.new(:diamond, 14, :black)}.to raise_error("Invalid Value")
      expect{ Card.new(:diamond, 10, :blue)}.to raise_error("Invalid Color")
    end
  end 
end 

