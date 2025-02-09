# frozen_string_literal: true
require 'rails_helper'

feature 'Posts', type: :feature do
  scenario 'shows newest post first' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/userswall'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Newest message'
    click_button 'Submit'
    expect(page.find('p:nth-child(9)')).to have_content "Newest message"
  end
end
