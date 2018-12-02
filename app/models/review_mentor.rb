class ReviewMentor < ApplicationRecord
  belongs_to :mentor
  validates :content, presence: false
  validates :rating, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
