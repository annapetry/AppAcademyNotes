class Array
  def two_sum
    result = []
    
    self.each_with_index do |x, idx|
      self.each_with_index do |y, idx2|
          if self[idx] + self[idx2] == 0 && idx != idx2 && idx2 > idx
            result << [idx, idx2]
          end
      end
    end
      
    result
  end
end


p [-1, 0, 2, -2, 1].two_sum