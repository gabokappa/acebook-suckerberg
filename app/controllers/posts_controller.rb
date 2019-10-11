class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # like = Like.create({liked: 1, post_id: @post.id, user_id: current_user.id})
    # p like.save
    # p Like.all
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @likes = Like.all
    @likes_posts = {}
    @posts.each do |post|
      like_counter = 0
      @likes.where(post_id: post.id).each do |like|
        like_counter += 1
      end
      @likes_posts[post.id] = like_counter
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = 'ERROR: only the author can edit the post'
      redirect_to posts_url
    end
    if too_much_time_elapsed
      flash[:notice] = 'ERROR: You were too late! Update faster (10 mins limit)!'
      redirect_to posts_url
    end
  end

  def update
    authored_by_user?(params[:id]) ? @post.update(post_params) : flash[:notice] = "ERROR: only the author can edit the post"
    redirect_to posts_url
  end

  def destroy_post
    authored_by_user?(params[:id]) ? @post.destroy : flash_the_notice = flash[:notice] = "ERROR: only the author can delete this post"
    redirect_to posts_url
  end

  private

  def too_much_time_elapsed
    Time.now - @post.created_at > 600
  end

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def authored_by_user?(params_id)
    @post = Post.find_by(id: params_id)
    p @post
    current_user.id == @post.user_id ? true : false
  end

end
