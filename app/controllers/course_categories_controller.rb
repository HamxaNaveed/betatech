class CourseCategoriesController < ApplicationController
  before_action :set_course_category, only: %i[edit update]

  def index
    @course_categories = CourseCategory.all
  end

  def new
    @course_category = CourseCategory.new
  end

  def create
    @course_category = CourseCategory.new(course_category_params)
    if @area.save
      redirect_to course_categories_path, notice: "Course Category was successfully created"
    else
      render "new", notice: "Something went wrong"
    end
  end

  def edit
  end

  def update
    if @course_category.update(course_category_params)
      redirect_to course_categories_path, notice: "Course Category was successfully updated"
    else
      render "edit", notice: "Something went wrong"
    end
  end

  private

  def course_category_params
    params.require(:course_category).permit(:name)
  end

  def set_course_category
    @course_category = CourseCategory.find_by(id: params[:id])
  end
end
