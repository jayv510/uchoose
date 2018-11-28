class Mentor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nationality, presence: true
  validates :university, presence: true
  validates :degree_level, presence: true
  validates :major_category, presence: true

  mount_uploader :photo, PhotoUploader

end
