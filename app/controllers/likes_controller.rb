# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(post_params)
    redirect_to user_wall_path(find_post_wall(params[:post_id]))
  end

  def create_no_form_posts
    if post_has_likes?
      @like = Like.create(liked: 1, post_id: params[:post_id], user_id: current_user.id)
    else
      Like.all.where(post_id: params[:post_id], user_id: current_user.id).destroy_all
    end
    redirect_to user_wall_path(find_post_wall(params[:post_id]))
  end

  def create_no_form_comments
    if comment_has_likes?
      @like = Like.create(liked: 1, comment_id: params[:comment_id], user_id: current_user.id)
    else
      Like.all.where(comment_id: params[:comment_id],
                     user_id: current_user.id).destroy_all
    end
    redirect_to user_wall_path(find_comment_wall(params[:comment_id]))
  end

  def index
    @like = Like.all
  end

  private

  def post_has_likes?
    Like.all.where(post_id: params[:post_id], user_id: current_user.id).empty?
  end

  def comment_has_likes?
    Like.all.where(comment_id: params[:comment_id], user_id: current_user.id).empty?
  end

  def post_params
    params.require(:like).permit(:post_id, :comment_id, :liked).merge(user_id: current_user.id)
  end

  def find_post_wall(post_id)
    @current_post = Post.find_by(id: post_id)
    if @current_post.nil?
      return current_user.id
    else
      @current_post.wall_id
    end
  end

  def find_comment_wall(comment_id)
    @current_comment = Comment.find_by(id: comment_id)
    @current_post = Post.find_by(id: @current_comment.post_id)
    @current_post.wall_id
  end
end
