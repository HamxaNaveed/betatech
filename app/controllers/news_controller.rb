class NewsController < ApplicationController
  before_action :set_news, only: %i[ show ]

  def index
    @news = News.all
    @admins = Admin.all
  end

  def show
  end

  private
  
  def set_news
    @single_news = News.find_by!(slug: params[:slug])
  end
end
