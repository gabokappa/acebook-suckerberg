# frozen_string_literal: true

require 'rails_helper'

feature 'Not able to edit a comment after 600 seconds limit', type: :feature do
  scenario 'Can delete comment' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, friends!'
    click_button 'Submit'
    click_link 'Comment'
    fill_in 'Message', with: 'I am a comment'
    click_button 'Submit'
    click_link 'Logout'
    Timecop.travel(Time.now + 601)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'Edit comment'
    expect(page).to have_content('ERROR')
    expect(page).to have_content('I am a comment')
  end
end
