require 'rails_helper'

feature "User can delete post ", type: :feature do
  scenario "Can delete posts" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, friends!"
    click_button "Submit"
    click_link "Delete"
    expect(page).to have_no_content('Hello, friends!')
    expect(page).to have_no_content('ERROR')
  end
end
