require 'rails_helper'

feature "goal creation" do

  before :each do 
    sign_up("HelloWorld", "password")
  end
  
  it "has a goal index page" do
    expect(page).to have_content("Goals")
  end

  feature "adding a goal" do

    it "allows user to create a goal" do
      click_button "Create Goal"
      page.should have_content("Goal:")
    end
    
    it "has all correct fields" do
      click_button "Create Goal"
      page.should have_field "Goal:"
      page.should have_content "Public?"
      page.should have_button "Add Goal"
    end
    
    it "rejects blank goal body" do
      click_button "Create Goal"
      click_button "Add Goal"     
      page.should have_content "Body can't be blank"
    end
    
    it "redirects to page with goal on it" do
      click_button "Create Goal"
      fill_in "Goal:", with: "Lose 10 pounds"
      click_button "Add Goal"
      
      page.should have_content("Lose 10 pounds")
    end
  end
end

feature "goal modification" do

  before :each do 
    sign_up("HelloWorld", "password")
    create_goal("Lose 10 pounds", true, false)
  end

  feature "editing a goal" do

    it "allows user to edit a goal" do
      click_button "Edit Goal"
      #TODO WARNING may not detect autofilled content
      # save_and_open_page
      find_field('Goal').value.should eq "Lose 10 pounds"
    end
    
    it "has all correct fields" do
      click_button "Edit Goal"
      page.should have_field "Goal:"
      page.should have_content "Public?"
      page.should have_button "Update Goal"
    end
    
    it "rejects blank goal body" do
      click_button "Edit Goal"
      fill_in "Goal:", with: ""
      click_button "Update Goal"      
      page.should have_content "Body can't be blank"
    end
    
    it "redirects to page with goal on it" do
      click_button "Edit Goal"
      fill_in "Goal:", with: "Lose 15 pounds"
      click_button "Update Goal"
      
      page.should have_content("Lose 15 pounds")
    end
  end
  
  feature "deleting a goal" do

    it "allows user to delete a goal" do
      click_button "Delete Goal"
      #TODO WARNING may not detect autofilled content
      page.should have_no_content("Lose 10 pounds")
    end
  end
end

feature "goals index tests" do

  before :each do 
    sign_up("HelloWorld", "password")
    click_button "Create Goal"
    fill_in "Goal:", with: "Lose 10 pounds"
    check 'public'
    click_button "Add Goal"
    #seconds private goal
    click_button "Create Goal"
    fill_in "Goal:", with: "change username"
    # check "public"
    click_button "Add Goal"
  end

  feature "shows all current user's goals" do
    it 'shows all current_user goals' do
      page.should have_content("Lose 10 pounds")
      page.should have_content("change username")
    end
  end

  feature "hides secrets" do
    before :each do
      sign_up("GoodbyeCruelWorld", "password1")
    end
    it "does not show other users' secret goals" do
      page.should have_no_content("change username")
    end
    
    it "show other users' public goals" do
      page.should have_content("Lose 10 pounds")
    end
  end
  
  
end