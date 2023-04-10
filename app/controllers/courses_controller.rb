class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show ]
  def index
    @courses = Course.all
  end
    
  def new
    @course = Course.new
  end

  def show
  end

  def mycourse
    @enrollments = CourseEnrollement.where(user_id: current_user.id)
    @mycourse = @enrollments.map(&:course)
  end

  private
    
  def set_course
    @course = Course.find_by!(slug: params[:slug])
  end
end