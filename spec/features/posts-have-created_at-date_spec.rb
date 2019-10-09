require 'rails_helper'
require 'test_database_helper'

feature "Posts show date", type: :feature do
  scenario "shows the date" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    t = Time.now
    populate_test_database("Hello it is Gabriel here")
    visit "/posts"
    expect(page).to have_content(t.strftime(':%M'))
  end
end
