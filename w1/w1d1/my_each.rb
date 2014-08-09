class Array
  def my_each
    self.map { yield }
    self
  end
end


# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end


p return_value # => [1, 2, 3]