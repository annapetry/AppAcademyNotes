require 'rspec'
require 'arrays.rb'

RSpec.describe Array do 
  
  describe "#my_uniq" do 
    
    it 'returns unique nums' do
      expect( [1, 2, 3, 1, 1].my_uniq ).to eq( [1, 2, 3] )
    end

  end
  
  describe "#two_sum" do
    it 'returns indices of array where those elements equal 0' do
      expect( [-1, 0, 2, -2, 1].two_sum ).to eq([[0, 4], [2, 3]] )
    end
      
  end

  
  describe "#my_transpose" do
    let(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    it 'returns new array of the original arrays cols as rows' do
      expect( rows.my_transpose ).to eq( [[0, 3, 6], [1, 4, 7], [2, 5, 8]] )
    end
    
  end

end
    