FactoryBot.define do
  factory :random_user, class: User do
    sequence(:email) { |n| "email#{n}@email.com" }
    password_digest { "MyString" }
  end
end
