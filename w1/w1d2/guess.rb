comp_choice = rand(1..100)
count = 0
begin
  puts "Enter number between 1 and 100:"
  user_choice = gets.chomp.to_i
  if user_choice < comp_choice
    puts "Too low"
  else
    puts "Too high"
  end
  count += 1
end while comp_choice != user_choice
puts "You guessed #{comp_choice} in #{count} guesses!"
