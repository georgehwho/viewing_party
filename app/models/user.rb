class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :friendships, class_name: :Friendship, dependent: :destroy
  has_many :friends, through: :friendships

  has_secure_password
end
