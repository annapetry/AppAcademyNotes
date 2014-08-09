def my_transpose(array)
  
result = []
temp = []
(array.length).times do |x|
  (array.length).times do |y|  
    temp << array[y][x]
  end
  result << temp
  temp = []
end
return result
end

p my_transpose([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
  ])