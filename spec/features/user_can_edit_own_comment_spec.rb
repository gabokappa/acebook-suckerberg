require 'rails_helper'

feature "Comment Edit", type: :feature do
  scenario "Can edit own comments and view them" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Comment"
    fill_in "Message", with: "I am a comment"
    click_button "Submit"
    click_link "Edit comment"
    fill_in "Message", with: "This is an edited comment"
    click_button "Submit"
    expect(page).to have_content("This is an edited comment")
    expect(page).to have_content("Edit successful")
    expect(page).to have_no_content("I am a")
  end
end