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
    if too_much_time_elapsed
      flash[:notice] = 'ERROR: You were too late! Update faster (10 mins limit)!'
      redirect_to posts_url
    end
  end

  def update
    if authored_by_user?(params[:id])
      @comment.update(comment_params)
      flash[:notice] = 'Edit successful'
    else
      flash[:notice] = 'ERROR: only the author can edit the comment'
    end
    redirect_to posts_url
  end

  def destroy_comment
    if authored_by_user?(params[:id])
      @comment.destroy
      flash[:notice] = '*** Comment successfully deleted ***'
      else
        flash[:notice] = "ERROR: only the author can delete the comment"
      end
    redirect_to posts_url
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: @post_id)
  end


  def authored_by_user?(params_id)
    @comment = Comment.find_by(id: params_id)
    @post_id = @comment.post_id
    current_user.id == @comment.user_id ? true : false
  end

  def too_much_time_elapsed
    Time.now - @comment.created_at > 600
  end

end
