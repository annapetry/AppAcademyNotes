require 'deck'

RSpec.describe Deck do 
  
  let(:qhearts) { Card.new(:hearts, :queen) }
  let(:khearts) { Card.new(:hearts, :king) }
  let(:deck) { Deck.new }
  let(:twocards) { Deck.new( [qhearts, khearts]) }
  let(:multiplecards) { Deck.new( [qhearts, khearts, khearts, khearts] )}
  
  it "has a count method" do
    expect( twocards.count ).to eq( 2 )
  end
  
  it "creates a deck of 52 unique cards" do
    expect( deck.count ).to eq( 52 )
  end
  
  describe "#take_card" do
    it "takes a card from the 'top' of the deck" do
      expect( twocards.take_cards(1) ).to eq( [qhearts]  )
    end
    
    it "takes multiple cards" do
      expect( multiplecards.take_cards(3) ).to eq( [qhearts, khearts, khearts] )
    end
    
    it "raises an error if there are not enough cards to take" do
      expect do
        twocards.take_cards(3) 
      end.to raise_error(NotEnoughCardsError)
    end
  end
  
  describe "#return_cards" do
    it "returns cards back to the 'bottom' of the deck" do
      expect( twocards.return_cards([khearts, qhearts]) ).to eq( twocards.cards.concat([khearts, qhearts]) )
    end
  end
  
  


  
  

end