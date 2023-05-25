class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :cnic_front
  has_one_attached :profile
  has_one_attached :cnic_back
  has_one_attached :last_qualification
  has_many :certificates
  has_many :course_enrollements
  has_many :courses, through: :course_enrollements
  has_many :comments
  has_many :assignments

  enum status: %i[non-active active]

  # def active_for_authentication?
  #   if super && active?
  #     true
  #   else
  #     message = "Your account is not active. Please contact the administrator."
  #     redirect_to root_path, alert: message
  #     false
  #   end
  # end

  # def active?
  #   status == 'active'
  # end
  def enrolled_in?(course)
    course_enrollements.where(course_id: course.id).exists?
  end

  after_create :assign_default_role

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
