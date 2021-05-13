class Party < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  belongs_to :host, class_name: :User

  has_many :party_guests, dependent: :destroy
end
