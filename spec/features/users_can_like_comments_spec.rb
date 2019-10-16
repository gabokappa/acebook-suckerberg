# frozen_string_literal: true

require 'rails_helper'

feature 'Likes', type: :feature do
  scenario 'user can like a comment' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Comment'
    fill_in 'Message', with: 'I am a comment!'
    click_button 'Submit'
    click_link(Emoji.find_by_alias('metal').raw.to_s, match: :first)
    expect(page).to have_content("#{Emoji.find_by_alias('metal').raw} 1")
    user2 = FactoryBot.create(:user)
    login_as(user2, scope: :user)
    visit '/posts'
    click_link(Emoji.find_by_alias('metal').raw.to_s, match: :first)
    expect(page).to have_content("#{Emoji.find_by_alias('metal').raw} 2")
    click_link(Emoji.find_by_alias('metal').raw.to_s, match: :first)
    expect(page).to have_content("#{Emoji.find_by_alias('metal').raw} 1")
  end
end
