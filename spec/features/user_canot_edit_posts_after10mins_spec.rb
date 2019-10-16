# frozen_string_literal: true
require 'rails_helper'

feature 'Post not able to edit after 600 seconds limit', type: :feature do
  scenario 'Can delete posts' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, friends!'
    click_button 'Submit'
    click_link 'Logout'
    Timecop.travel(Time.now + 601)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'Edit'
    expect(page).to have_content('ERROR')
    expect(page).to have_content('Hello, friends!')

  end
end
