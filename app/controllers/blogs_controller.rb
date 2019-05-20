class BlogsController < ApplicationController
  before_action :move_to_index , except: :index

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(6)
    @comment = Comment.new
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.user_id == current_user.id
      @blog.destroy
    end
    redirect_to action: :index
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
    redirect_to action: :index
  end
  
  private
  def blog_params
    params.require(:blog).permit(:text, :title)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end 
end
