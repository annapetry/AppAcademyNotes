def by_2(array)
  result = [] 
  array.each { |x| result << (x * 2) }
  result
end

p by_2([1, 2, 9])

