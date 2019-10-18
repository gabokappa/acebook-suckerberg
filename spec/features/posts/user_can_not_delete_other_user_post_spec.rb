# frozen_string_literal: true
require 'rails_helper'

feature 'Posts', type: :feature do
  scenario "user cannot delete another user's post" do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Logout'
    user2 = FactoryBot.create(:user)
    login_as(user2, scope: :user)
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content('ERROR: only the author can delete this post')
    expect(page).to have_content('Hello, world!')
  end
end
