FactoryBot.define do

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
  end
end
