class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :course_category
  has_one_attached :image
  has_many :course_enrollements
  has_many :users, through: :course_enrollements
  has_many :certificates
  enum status: %i[non-active active]

  validates :title, presence: true
  validates :description, presence: true
  validates :slug, presence: true
  validates :status, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
