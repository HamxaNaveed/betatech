class CertificatesController < ApplicationController
  before_action :set_certificate,  only: %i[ show ]

  def show
  end

  def validate
    first_name = params[:first_name]
    last_name = params[:last_name]
    course_name = params[:course_name]
    certificate_number = params[:certificate_number]

    @user = User.find_by(firstname: first_name, lastname: last_name)
    @course = Course.find_by(title: course_name)
    if @user.nil?
      flash[:error] = "User not found"
    elsif @course.nil?
      flash[:error] = "Course not found"
    else
      @certificate = Certificate.find_by(certificate_number: certificate_number, user_id: @user.id, course_id: @course.id)
    end
    if @certificate.nil?
      flash[:error] = "Certificate is invalid"
      redirect_to validate_certificates_path
    else
      flash[:success] = "Certificate is valid"
      redirect_to certificate_path(@certificate)
    end
  end

  private
  
  def set_certificate
    @certificate = Certificate.find_by!(id: params[:id])
  end
end
