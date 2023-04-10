class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  has_many :comments
  has_one_attached :image
  enum status: %i[non-active active]

  validates :title, presence: true
  validates :description, presence: true
  validates :slug, presence: true
  validates :status, presence: true
  validates :image, presence: true
end
