require './lib/posts_helper'

class UsersController < ApplicationController
  include PostsHelper

  def index
    @usersposts = Post.where(user_id: current_user.id)
    @likes_posts = likes_all_posts
    @likes_comments = likes_all_comments
    @user = User.find_by(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    p @user
    @usersposts = Post.where(user_id: current_user.id)
    @likes_posts = likes_all_posts
    @likes_comments = likes_all_comments
  end

end
