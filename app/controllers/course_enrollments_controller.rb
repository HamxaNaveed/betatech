# app/controllers/course_enrollments_controller.rb
class CourseEnrollmentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_course

  def new
    @enrollment = @course.course_enrollements.build
  end

  def create
    @enrollment = @course.course_enrollements.build(enrollment_params)
    @enrollment.user = current_user
    
    if @enrollment.save
      flash[:success] = "Course is enrolled"
      redirect_to @course
    else
      flash[:alert] = "There was an error enrolling the course."
      render :new
    end
  end

  private

  def set_course
    @course = Course.find_by!(slug: params[:course_slug])
  end

  def enrollment_params
    params.require(:course_enrollement).permit(:course_id)
  end
end
