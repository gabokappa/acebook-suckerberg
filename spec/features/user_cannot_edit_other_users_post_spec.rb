require 'rails_helper'

RSpec.feature "User editing posts ", type: :feature do
  scenario "User cannot edit another user's post" do
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
    expect(page).to have_content("ERROR")
  end
end
