class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post_id = params[:comment][:post_test]
    @comment = Comment.create(comment_params)
    flash[:notice] = "*** Your comment has been posted! ***"
    redirect_to posts_url
  end

  def index
    @comments = Comment.all
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: @post_id)
  end

end
