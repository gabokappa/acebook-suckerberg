require 'rails_helper'

feature "Likes", type: :feature do
  scenario "user can like a post" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link 'New post'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'New post'
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    click_link("#{ Emoji.find_by_alias("+1").raw }", :match => :first)
    expect(page).to have_content("#{ Emoji.find_by_alias("+1").raw } 1")
    user2 = FactoryBot.create(:user)
    login_as(user2, :scope => :user)
    visit "/posts"
    click_link("#{ Emoji.find_by_alias("+1").raw }", :match => :first)
    expect(page).to have_content("#{ Emoji.find_by_alias("+1").raw } 2")

  end
end
