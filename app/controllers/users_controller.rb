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
    if params[:id] == nil
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @usersposts = Post.where(wall_id: @user.id)
    @likes_posts = likes_all_posts
    @likes_comments = likes_all_comments
    @albums = Album.all.where(user_id: @user.id)
  end

  def list 
  end 

end
