require 'deck' 

describe Deck do
  subject(:deck){deck = Deck.new}

  describe "#initialize" do    
    it "should call the #make_deck method" do    
      expect(Deck.claselfss).to receive(:make_deck)

    end 
  end 

  describe "#length" do
    it "should return the number of cards in the deck" do    
      expect(deck.length).to eq(52) 
      deck = deck.cards.drop(10) 
      # make a test for after we take out some cards - return correct # 
      expect(deck.length).to eq(42) 
    end 
  end 

  describe "#make_deck" do    
    let(:card){double("card")}

    it "should"
  end 

  describe "#shuffle!" do 
    it "should return a shuffled deck of cards" do
      expect(deck).to receive 
    end 
  end 

end 