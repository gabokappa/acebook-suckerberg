# frozen_string_literal: true
require 'rails_helper'

feature 'Posts', type: :feature do
  scenario 'user can delete posts' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, friends!'
    click_button 'Submit'
    click_link 'Delete'
    expect(page).to have_no_content('Hello, friends!')
    expect(page).to have_no_content('ERROR')
    expect(page).to have_content('*** Post successfully deleted ***')
  end
end
