

class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
  
  def my_map(&proc)
    [].tap do |array|
      self.my_each do |el|
        array << proc.call(el)
      end
    end
  end
  
  
  
  def my_select
    [].tap do |array|
      self.my_each do |el|
        array << el if yield(el)
      end
    end
  end
end
################PART 1###################################

class Array
  def my_inject(&proc)
    return [] if self.length == 0
    return self[0] if self.length == 1
    sum = self[0]
    self[1..-1].my_each do |el|
      sum = yield(sum, el)
    end
    sum
  end
  
  def my_sort!(&proc)
    sorted = false

    until sorted
      sorted = true
      (0...self.length).to_a.my_each do |i|
        
        if yield(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i] 
          sorted = false
        end
      end
    end
    self
  end
  
  def my_sort(&proc)
    
    duplicate_array = self.dup
    duplicate_array.my_sort!(&proc)
  end
  
end
x = [4, 3, 2, 1]
y = %w{ b c d a }


####################### PART 2 ######################


def eval_block(*args)
  return "NO BLOCK GIVEN" unless block_given?
  puts yield(*args)

end

eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end

eval_block(1,2,3,4,5) do |*args|
  args.inject(:+)
end

puts eval_block(1, 2, 3)














