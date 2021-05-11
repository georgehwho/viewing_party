class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :friendships, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships

  has_secure_password
end
