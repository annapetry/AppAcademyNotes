def median(array)
  array = array.sort
  if array.length.even?
    return (array[array.length/2] + array[array.length/2 - 1])/2.0
  else
    return array[array.length/2]
  end
end

p median([1,2,3])
p median([1,2,3,4])
p median([4,6,1,3])