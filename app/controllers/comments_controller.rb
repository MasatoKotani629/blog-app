class CommentsController < ApplicationController
  
  before_action :authenticate_user!

  
  def create
    Comment.create(text: comment_params[:text], blog_id: comment_params[:blog_id], user_id: current_user.id)
    redirect_to controller: :blogs, action: :index
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(blog_id: params[:blog_id])
  end
end
