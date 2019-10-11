require './lib/posts_helper'

class PostsController < ApplicationController
  include PostsHelper
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @likes_posts = likes_all_posts
    @likes_comments = likes_all_comments
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
    current_user.id == @post.user_id ? true : false
  end

end
