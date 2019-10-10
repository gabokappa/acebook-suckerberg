FactoryBot.define do
  factory :comment do
    message { "MyString" }
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"foobar"}
    confirmed_at          {Time.now}
  end
end
