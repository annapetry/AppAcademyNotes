require 'card'

RSpec.describe Card do
  
  describe 'card' do
    let(:qhearts) { Card.new( :hearts, :queen) }
    let(:joker) { Card.new( :jokerface, :joker) }
    
    it "knows its suit" do
      expect(qhearts.suit).to eq( "hearts" )
    end
    
    it "knows its value" do
      expect(qhearts.value).to eq( "queen" )
    end
    
    it "knows it's a valid card" do
      expect do
        joker.suit
      end.to raise_error(JokerFaceError)
    end
    
    it "knows it's point value" do 
      expect(qhearts.point_value).to eq( 12 )
    end
    
  end
end 