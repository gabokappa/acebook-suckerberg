require 'rails_helper'
require 'test_database_helper'

feature "Album", type: :feature do
  scenario "Creates new album" do
    user3 = FactoryBot.create(:user)
    login_as(user3, :scope => :user)
    visit "/"
    click_link "New Album"
    fill_in "album[name]", with: "First Album"
    click_button "Create Album"
    visit "/"
    expect(page).to have_content "First Album"
    end

    scenario "Uploads new photo" do
      user3 = FactoryBot.create(:user)
      login_as(user3, :scope => :user)
      visit "/"
      click_link "New Album"
      fill_in "album[name]", with: "First Album"
      click_button "Create Album"
      visit "/"
      click_link "Edit"
      find('form input[type="file"]').set("#{::Rails.root}/test_pic.jpg")
      click_button "Submit"
      visit "/"
      click_link "Show album"
      expect(page).to have_xpath("//img[contains(@src,'test_pic.jpg')]")
    end

    scenario "Deletes a photo" do
      user3 = FactoryBot.create(:user)
      login_as(user3, :scope => :user)
      visit "/"
      click_link "New Album"
      fill_in "album[name]", with: "First Album"
      click_button "Create Album"
      visit "/"
      click_link "Edit"
      find('form input[type="file"]').set("#{::Rails.root}/test_pic.jpg")
      click_button "Submit"
      visit "/"
      click_link "Edit"
      expect(page).to have_xpath("//img[contains(@src,'test_pic.jpg')]")
      click_link("Delete", :match => :first)
      expect(page).not_to have_xpath("//img[contains(@src,'test_pic.jpg')]")
    end

    scenario "user not owning album can not delete photo" do
      user3 = FactoryBot.create(:user)
      login_as(user3, :scope => :user)
      visit "/"
      click_link "New Album"
      fill_in "album[name]", with: "First Album"
      click_button "Create Album"
      visit "/"
      click_link "Edit"
      find('form input[type="file"]').set("#{::Rails.root}/test_pic.jpg")
      click_button "Submit"
      user4 = FactoryBot.create(:user)
      login_as(user4, :scope => :user)
      visit "/users/#{user3.id}"
      click_link "Edit"
      expect(page).to have_xpath("//img[contains(@src,'test_pic.jpg')]")
      click_link("Delete", :match => :first)
      expect(page).to have_content('ERROR: only the owner of the albume can delete the Picture')
      visit "/users/#{user3.id}"
      click_link 'Show album'
      expect(page).to have_xpath("//img[contains(@src,'test_pic.jpg')]")
    end
    scenario "user not owning album can not delete album" do
      user3 = FactoryBot.create(:user)
      login_as(user3, :scope => :user)
      visit "/"
      click_link "New Album"
      fill_in "album[name]", with: "First Album"
      click_button "Create Album"
      visit "/"
      click_link "Edit"
      find('form input[type="file"]').set("#{::Rails.root}/test_pic.jpg")
      click_button "Submit"
      user4 = FactoryBot.create(:user)
      login_as(user4, :scope => :user)
      visit "/users/#{user3.id}"
      click_link "Delete"
      expect(page).to have_content('ERROR: only the owner of the album can delete the Album')
      visit "/users/#{user3.id}"
      expect(page).to have_content('First Album')
    end
end
