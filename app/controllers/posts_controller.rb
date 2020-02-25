class PostsController < ApplicationController
  before_action :require_user
  def index
    @comment = Comment.new
    @posts = Post.all
  end
  def new
  end
  def create
    @post = Post.new(info:post_params[:info],user:current_user)
    if @post.save
      redirect_to root_path
    else
        flash.now[:error] = "Your post is either too short or too long."
        render 'new'
    end
  end



  private
  def post_params
    params.require(:form).permit(:info)
  end
end
