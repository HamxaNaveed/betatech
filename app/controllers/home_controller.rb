class HomeController < ApplicationController
  def index
    @course_categories = CourseCategory.all
    @courses = Course.all
    @news = News.all
    @admins = Admin.all
  end

  def profile
    @assignment = Assignment.new
  end

  def aboutus
    @courses = Course.all
    @admins = Admin.all
  end

  def gallery
  end
end
