def stock_picker(array)
  most_prof = 0
  result = []
  
  array.each_with_index do |price, day|
    array.each_with_index do |price2, day2|
      next if day2 <= day
      x = price2 - price
      if x > most_prof
        result << [day, day2]
        most_prof = x
      end
    end
  end
  result.last
  
end


p stock_picker([2, 4, 50, 6])