class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by!(slug: params[:slug])
    @comments = @blog.comments
  end
end
