class Array

  def my_uniq
    [].tap do |result|
      self.each do |num|
        result << num unless result.include?(num)
      end
    end
  end
  
  def two_sum
    [].tap do |result|
      self.each_index do |i|
        self.each_index do |j|
          next if j <= i 
          result << [i, j] if self[i] + self[j] == 0
        end
      end
    end
  end
  
  def my_transpose

    [].tap do |result|
      self.each_index do |i|
        temp = []
        self.each_index do |j|
          temp << self[j][i]
        end
        result << temp
      end
    end
  
  end
  
end