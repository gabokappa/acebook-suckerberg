require 'rails_helper'
require 'test_database_helper'

feature 'Authentication' do
  scenario 'User can sign up and sign in' do
    visit '/posts'
    click_link('Sign up', :match => :first)
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    save_and_open_page
    expect(page).to have_current_path('/posts')
  end
  scenario 'User need to provide valid email' do
    visit '/posts'
    click_link('Sign up', :match => :first)
    fill_in 'user_email', with: 'test'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_current_path('/user')
  end
  scenario 'User need to provide password with at least 6 characters' do
    visit '/posts'
    click_link('Sign up', :match => :first)
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123'
    fill_in 'user_password_confirmation', with: '123'
    click_button 'Sign up'
    expect(page).to have_current_path('/user')
  end
end
