class Array
  def my_uniq
    new_array = []
    self.each {|x| new_array << x unless new_array.include? x }
    new_array 
  end
end

p [1,2,3,5,6].my_uniq
p [1,1,2,4,5,4].my_uniq