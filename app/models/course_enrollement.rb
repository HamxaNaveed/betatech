class CourseEnrollement < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum status: %i[non-active active]

end
