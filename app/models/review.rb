class Review < ApplicationRecord
  belongs_to :bookings
  validates :rating, presence: true
end
