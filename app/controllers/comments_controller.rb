class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find_by!(slug: params[:blog_slug])
    @comment = @blog.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog }
      else
        format.html { redirect_to @blog, alert: "Comment not created." }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:contentofcomment)
  end
end
