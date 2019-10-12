require 'rails_helper'

feature "User can delete comment ", type: :feature do
  scenario "Can delete own comments" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, friends!"
    click_button "Submit"
    click_link("#{ Emoji.find_by_alias("+1").raw }", :match => :first)
    click_link "Comment"
    fill_in "Message", with: "I am a comment"
    click_button "Submit"
    click_link("#{ Emoji.find_by_alias("metal").raw }", :match => :first)
    click_link "Delete"
    expect(page).to have_no_content('Hello, friends!')
    expect(page).to have_no_content('I am a comment')
    expect(page).to have_no_content('ERROR')
  end
end
