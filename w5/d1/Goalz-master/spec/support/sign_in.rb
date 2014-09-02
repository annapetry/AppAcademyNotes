def sign_in
  fill_in "Username", with: "HelloWorld"
  fill_in "Password", with: "password"
  click_button "Log In"
end