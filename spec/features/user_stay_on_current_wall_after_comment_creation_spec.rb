require 'rails_helper'

feature "comments", type: :feature do
  scenario "User can comment on a post" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/users/#{user.id}"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Comment"
    fill_in "Message", with: "I am a comment"
    click_button "Submit"

    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('I am a comment')
    expect(page).to have_content('*** Your comment has been posted! ***')
    expect(page).to have_current_path("/users/#{user.id}")
  end
end