require 'rails_helper'

feature "comment creation" do

  before :each do 
    sign_up("HelloWorld", "password")
    create_goal("Lose 10 pounds", true, false)
  end

  feature "adding a comment to a goal" do

    it "has all correct fields" do
      click_button "Add Comment"
      page.should have_field "Comment:"
      page.should have_button "Submit"
    end

    it "allows user to comment a goal" do
      click_button "Add Comment"
      fill_in "Comment:", with: "You have a fat ass"
      click_button "Submit"  
      page.should have_content("You have a fat ass")
    end
    
    it "rejects blank comment body" do
      click_button "Add Comment"
      click_button "Submit"     
      page.should have_content "Body can't be blank"
    end
    
    it "allows user to delete comments they've submitted" do
      click_button "Add Comment"
      fill_in "Comment:", with: "You have a skinny ass"
      click_button "Submit"
      click_button "Remove Comment"
      page.should have_no_content "You have a skinny ass"
    end
    
    it "allows user to edit comments they've submitted'" do
      click_button "Add Comment"
      fill_in "Comment:", with: "You have a skinny ass"
      click_button "Submit"
      click_button "Edit Comment"
      fill_in "Comment:", with: "You actually have a fat ass"
      click_button "Update Comment"
      
      page.should have_content "You actually have a fat ass"
    end
  end
  
  feature "adding a comment to a User's show page" do
    it 'has comment button on User show page' do
      sign_up("HelloWorld", "password")
      # TODO: everything else in the world
      # starting with, visiting the users show page
      expect(page).to have_button("Add Comment")
    end
    
    
    
  end
    

end