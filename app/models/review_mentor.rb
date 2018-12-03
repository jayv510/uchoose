class ReviewMentor < ApplicationRecord
  belongs_to :mentor
  belongs_to :prospective
  validates :content, presence: false
  validates :rating, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }

  def student
    "#{self.prospective.first_name} #{self.prospective.last_name}"
  end
end
