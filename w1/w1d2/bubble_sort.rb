def bubble_sort(array)
  
  sorted = false
  until sorted
    sorted = true
    (array.count - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end  
    end
  end
  array  
end