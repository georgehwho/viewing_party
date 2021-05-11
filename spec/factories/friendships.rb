FactoryBot.define do
  factory :friendship, class: Friendship do
    user_id { nil }
    friend_id { nil }
  end
end
