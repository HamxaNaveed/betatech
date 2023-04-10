class CourseCategory < ApplicationRecord
  has_many :courses
  has_one_attached :image
  enum status: %i[non-active active]
  validates :name, presence: true
end
