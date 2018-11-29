class Booking < ApplicationRecord
  belongs_to :prospectives
  belongs_to :mentors
  has_many :reviews
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :total_cost, presence: true
end
