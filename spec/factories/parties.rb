FactoryBot.define do
  factory :party do
    host { nil }
    title { "MyString" }
    duration { 1 }
    date { "2021-05-12" }
    start_time { "2021-05-12 23:08:20" }
  end
end
