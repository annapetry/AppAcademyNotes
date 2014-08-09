def hanoi
  my_hash = { "a" => [3, 2, 1], "b" => [], "c" => [] }
  puts my_hash
  correct = [3,2,1]
    while my_hash["b"] != correct && my_hash["c"] != correct
      puts "pile A is #{my_hash["a"]}"
      puts "pile B is #{my_hash["b"]}"
      puts "pile C is #{my_hash["c"]}"
      puts "Which piles do you want to move from?"
      from = gets.chomp
      puts "Which pile do you like to move into?"
      into = gets.chomp
      x = my_hash[from].last
      y = my_hash[into].last 
      
      if y.nil?
         my_hash[into] << my_hash[from].pop
         next  
      end
      
      if x.to_i < y.to_i 
        my_hash[into] << my_hash[from].pop
        next
      else
        puts "The disc has to be smaller than the pile you move in."
        next
      end

    end

    puts "You are right!"
  
  end
  
  
   hanoi
  