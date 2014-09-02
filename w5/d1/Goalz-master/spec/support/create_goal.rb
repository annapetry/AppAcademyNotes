def create_goal(content, secret, complete)
  click_button "Create Goal"
  fill_in "Goal:", with: content
  
  if secret == false
    check 'public'
  end
  
  if complete == true
    check 'completed'
  end
  
  click_button "Add Goal"
end
