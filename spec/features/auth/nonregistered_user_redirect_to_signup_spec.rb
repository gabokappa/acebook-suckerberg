require 'rails_helper'

feature 'Authentication - protection' do
  scenario 'unauthed user is always redirected to sign up' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    logout(:user)
    visit '/posts'
    expect(page).to have_current_path('/user/sign_in')
    visit '/users'
    expect(page).to have_current_path('/user/sign_in')
  end
end
