require 'rails_helper'

RSpec.feature "User edits ", type: :feature do
  scenario "Can edit posts and view them" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Logout"
    user2 = FactoryBot.create(:user)
    login_as(user2, :scope => :user)
    visit "/posts"
    click_link 'Edit'
    expect(page).to have_content("This MESSAGE isn't yours!")
  end
end
