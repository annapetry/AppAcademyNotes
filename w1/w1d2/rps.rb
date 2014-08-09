def rps(str)
  rps_array = ["rock", "paper", "scissors"]
  comp_choice = rps_array[rand(3)]
  
  puts "#{comp_choice.capitalize}, #{compare(str, comp_choice)}"
end


def compare(user_move, comp_choice)
  if user_move == "rock"
    if comp_choice == "rock"
      return "Draw"
    elsif comp_choice == "scissors"
      return "Win"
    elsif comp_choice == "paper"
      return "Lose"
    end
  elsif user_move == "scissors"
    if comp_choice == "rock"
      return "Lose"
    elsif comp_choice == "scissors"
      return "Draw"
    elsif comp_choice == "paper"
      return "Win"
    end
  elsif user_move == "paper"
    if comp_choice == "rock"
      return "Win"
    elsif comp_choice == "scissors"
      return "Lose"
    elsif comp_choice == "paper"
      return "Draw"
    end
  end
end

rps("rock")
rps("scissors")
rps("paper")