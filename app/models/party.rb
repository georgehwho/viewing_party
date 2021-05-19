class Party < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :movie_id, presence: true

  belongs_to :host, class_name: :User, foreign_key: :host_id

  has_many :party_guests, dependent: :destroy
end
