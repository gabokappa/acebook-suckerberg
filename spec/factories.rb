FactoryBot.define do
  factory :message do
    body { "MyText" }
    user { nil }
    chat_room { nil }
  end

  factory :chat_room do
    title { "MyString" }
    user { nil }
  end

  factory :album do
    name { "MyText" }
    user_id {FactoryBot.create(:user).id}
  end


  factory :like do
    liked { 1 }
  end

  factory :comment do
    message { "MyString" }
    user_id {FactoryBot.create(:user).id}
    post_id {FactoryBot.create(:post).id}
  end

  factory :post do
    message { "MyString" }
    user_id {FactoryBot.create(:user).id}
    wall_id { 1 }
    id {1}
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"foobar"}
    confirmed_at          {Time.now}
    profile_pic           {File.open("#{::Rails.root}/test_pic.jpg")}
  end
end
