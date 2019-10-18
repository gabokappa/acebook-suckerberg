# frozen_string_literal: true
require 'rails_helper'

feature 'posts', type: :feature do
  scenario 'user can edit own posts and view them' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
    expect(page).to have_no_content('ERROR')
  end
end
