require 'rails_helper'
require 'test_database_helper'

# TODO - change this test when users are linked to the post.

RSpec.feature "Posts show date", type: :feature do
  scenario "shows the date" do
    t = Time.now
    populate_test_database("Hello it is Gabriel here")
    visit "/posts"
    expect(page.find('p:nth-child(1)')).to have_content(t.strftime(':%M'))
  end
end
