# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { 'MyText' }
    user_id { FactoryBot.create(:user).id }
  end

  factory :like do
    liked { 1 }
    post_id { FactoryBot.create(:post).id }
    user_id { FactoryBot.create(:user).id }
  end

  factory :comment do
    message { 'MyString' }
    user_id { FactoryBot.create(:user).id }
    post_id { FactoryBot.create(:post).id }
  end

  factory :post do
    message { 'MyString' }
    user_id { FactoryBot.create(:user).id }
    wall_id { 1 }
    id { 1 }
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"foobar"}
    confirmed_at          {Time.now}
    profile_pic { fixture_file_upload "#{::Rails.root}/cat.jpeg", 'image/jpg' }
  end
end
