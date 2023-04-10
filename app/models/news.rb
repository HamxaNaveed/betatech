class News < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  enum status: %i[non-active active]

  belongs_to :admin
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :slug, presence: true
  validates :status, presence: true
  validates :image, presence: true
end
