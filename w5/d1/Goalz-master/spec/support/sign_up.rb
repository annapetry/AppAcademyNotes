def sign_up(username, password)
  visit new_user_url
  fill_in "Username", with: username
  fill_in "Password", with: password
  click_button "Create User"
end