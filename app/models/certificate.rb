class Certificate < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :certificate_number, presence: true
  validates :user, presence: true
  validates :course, presence: true

  has_one_attached :certificate
end
