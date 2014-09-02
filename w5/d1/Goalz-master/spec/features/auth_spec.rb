require 'rails_helper'

feature "the signup process" do

  before :each do 
    visit new_user_url
  end
  
  it "has a new user page" do
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    it "shows username and password fields on the signup page" do
      page.should have_content "Username"
      page.should have_content "Password"
    end
    
    it "has a sign up button" do
      page.should have_button "Create User"
    end
    
    it "rejects invalid username" do
      fill_in "Password", with: 'asdlkjfhasdf'
      click_button "Create User"      
      page.should have_content "Username can't be blank"
    end
    
    it "rejects a 0-length password" do
      fill_in "Username", with: 'asdlkjfhasdf'
      click_button "Create User"      
      page.should have_content "Password is too short"
    end
    
    it "rejects a too-short password" do
      fill_in "Username", with: 'asdlkjfhasdf'
      fill_in "Password", with: 'aaaaa'
      click_button "Create User"      
      page.should have_content "Password is too short"
    end

  end
end

feature "logging in" do
  before :each do 
    visit new_user_url
    sign_up("HelloWorld", "password")
    click_button "Log Out"
    visit new_session_url
  end

  it "should reject invalid login attempts" do
    fill_in "Username", with: "HelloWorld"
    fill_in "Password", with: "fakepassword"
    click_button "Log In"
    page.should have_content "Invalid Username or Password"
  end

  it "shows username on the homepage after login" do
    sign_in
    page.should have_content "HelloWorld"
  end
  
  it "redirects user to the goals index" do
    sign_in
    page.should have_content "Goals"
  end
end

feature "logging out" do

  it "begins with logged out state" do
    visit goals_url
    save_and_open_page
    page.should have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up("HelloWorld", "password")
    click_button "Log Out"
    page.should have_no_content "HelloWorld"
  end

end
