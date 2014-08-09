def non_it_range num1, num2
  return [] if num1 <= num2
  (num1..num2).each_with_object([]) {|el, obj| obj << el }
end
##################non-recursive##############################
def rec_range num1, num2
  return [] if num1 > num2
  
  [num1] | rec_range(num1 + 1, num2)
  # num1
end
  

  
def expo1(base, pow)
  return 1 if pow ==0
  return base if pow == 1
  
  return base * (expo(base, pow - 1))
end
 
 
def expo2(base, pow)
  return 1 if pow ==0
  return base if pow == 1
  
  if pow.even?
    result = expo2(base, pow / 2)
    return result * result
  else
    return expo2(base * expo2(base, (pow - 1) / 2), 2)
  end
  
end
 
####################RECURSIVE#########################################

def deep_dup arg
  if arg.is_a? Array
    new_var = arg.map do |x|
      deep_dup(x)
    end
  else
    new_var = arg
  end
  new_var
end

def fibs_it(n)
  seq = [0, 1]
  return seq[n] if n < 2
  
  (n - 2).times { seq << seq[-2] + seq[-1] }
  
  seq
end



def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  
  
  last = fibs(n - 1)
  
  last << last[-1] + last[-2]
  
end


def binary arr, target
  return nil if arr.empty?
  middle = arr.length / 2
  # return middle if arr.middle = target
  
  comparison = arr[middle] <=> target
  return middle if comparison == 0
  if comparison == 1
    binary(arr[0...middle], target)
  else
    middle + binary(arr[middle..-1], target)
  end

end
   
    
def change amount, coins = []
    return [] if amount <= 0
    change = []
    if coins.first <= amount
      amount -= coins.first
      change << coins.first

      change + change(amount, coins)
    else
       change(amount, coins[1..-1])
    end

  
  
end

################PHASE II###########################

def helper amount, coins = []
  coins.map do |coin|
    change(amount, coins[coins.index(coin)..-1])
  end.min_by(&:length)
end

#################### PHASE III ###################

def cheater_subsets array
  answer = []
  (0..array.length).each do |i|
    array.permutation(i).each do |perm|
      answer << perm.sort unless answer.include?(perm.sort)
    end
  end
answer
end

def method_name
  
end



def merge_sort array
  
  return array if array.size <= 1
 
  middle = array.length / 2
  left = array[0...middle]
  right = array[middle..-1]
  
  merge_helper(merge_sort(left), merge_sort(right)) 

end

def merge_helper left, right

  compare = []
  
  while !left.empty? && !right.empty?
    if left[0] < right[0]
      compare << left.shift
    else
      compare << right.shift
    end
  end
  
  compare += left
  compare += right
  
  compare

end















  