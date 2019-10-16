# frozen_string_literal: true
require 'rails_helper'
require 'test_database_helper'

feature 'Posts show date', type: :feature do
  scenario 'shows the date' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    Timecop.freeze
    t = Time.now
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content(t.strftime(':%M'))
    Timecop.return
  end
end
