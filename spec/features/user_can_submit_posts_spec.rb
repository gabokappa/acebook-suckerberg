# frozen_string_literal: true
require 'rails_helper'

feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
