class CommentsController < ApplicationController
  def create
    comment = Comment.new(info:comment_params[:info],post:Post.find(comment_params[:post_id]),user:current_user)
    if comment.save
      redirect_to root_path
    else
      if comment_params[:info].size() > 30
        flash[:error] = "comment too long."
      else
        flash[:error] = "comment too short."
      end
      redirect_to root_path
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:info, :post_id)
  end
end
