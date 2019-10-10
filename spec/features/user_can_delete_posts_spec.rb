require 'rails_helper'

feature "Post Delete within 600 seconds limit", type: :feature do
  scenario "Can delete posts" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, friends!"
    click_button "Submit"
    Timecop.travel(Time.now + 10)
    click_link "Delete"
    expect(page).to have_no_content('Hello, friends!')
  end
end
