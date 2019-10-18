# frozen_string_literal: true
require 'rails_helper'

feature 'Comments', type: :feature do
  scenario 'Can delete own comments' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, friends!'
    click_button 'Submit'
    click_link 'Comment'
    fill_in 'Message', with: 'I am a comment'
    click_button 'Submit'
    click_link 'Delete comment'
    expect(page).to have_no_content('I am a comment')
    expect(page).to have_no_content('ERROR')
    expect(page).to have_content('*** Comment successfully deleted ***')
  end
end
