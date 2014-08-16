require "./lib/towers"


RSpec.describe "Tower" do
  
  let(:tower1) { Tower.new }
  let(:tower2) { Tower.new }
  let(:game)   { Tower.new }
  
  describe '#valid_input?' do

    it 'ensures input is between 0-2' do
      
      expect( tower1.valid_input?(0, 2) ).to be true
      
      expect do
        tower2.valid_input?(5, 7)
      end.to raise_error(OutOfRangeError)

    end
    
    it 'raises an error if input is not an integer' do
      expect do 
        tower2.valid_input?(5, "rt") 
      end.to raise_error(ArgumentError)
    end
      
  end
  
  describe "#take_from" do
    
    it 'takes a disc from selected pile' do
      expect( game.take_from( 0 ) ).to eq( 1 )
    end
      
  end
  #
  # describe '#put_on' do
  #   it 'adds a disc to a pile'
  # end
  #
  # describe '#valid_move?' do
  #   it 'returns t of false is move is valid'
  # end
  
end