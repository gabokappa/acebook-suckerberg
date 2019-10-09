class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # puts post_params['message'].encode('utf-8')
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "ERROR: only the author can edit the post"
      redirect_to posts_url
    end
  end

  def update
    a = params[:id]
    @post = Post.find_by(id: a)
    if current_user.id == @post.user_id
      @post.update(post_params)
      redirect_to posts_url
    else
      redirect_to posts_url
      flash[:notice] = "ERROR: only the author can edit the post"
    end
  end

  def show
    a = params[:id]
    @post = Post.find_by(id: a)
    if current_user.id == @post.user_id
      @post.destroy
    else
      flash[:notice] = "ERROR: only the author can delete this post"
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
