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

  def edit
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      flash[:notice] = 'ERROR: only the author can edit the comment'
      redirect_to posts_url
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @post_id = @comment.post_id
    @comment.update(comment_params)
    redirect_to posts_url
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: @post_id)
  end


  def authored_by_user?(params_id)
    @comment = Comment.find_by(id: params_id)
    current_user.id == @comment.user_id ? true : false
  end

end
