class Mentor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :review_mentors, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nationality, presence: true
  validates :university, presence: true
  validates :degree_level, presence: true
  validates :major_category, presence: true

  mount_uploader :photo, PhotoUploader

  # searchkick

           include PgSearch
      pg_search_scope :search,
        against: [ :university, :nationality, :major, :major_category, :first_name, :last_name, :degree_level ],
        using: {
          tsearch: { prefix: true } # <-- now `superman batm` will return something!
        }


        def average_review
          all = self.review_mentors.map {|review| review.rating.to_i} #array
          sum = all.reduce(0, :+)
          decimal_sum = sum / all.count.to_f
          decimal_sum.round(1)
        end
end
