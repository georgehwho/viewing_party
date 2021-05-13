class Party < ApplicationRecord
  belongs_to :host, class_name: :User

  has_many :party_guests
end
