class User < ApplicationRecord
  validates :email, uniqueness:true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  has_many :friendships, class_name: :Friendship, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :parties, dependent: :destroy, foreign_key: :host_id

  def invited_parties
    PartyGuest.where(guest_id: self.id)
              .map(&:party)
  end
end
