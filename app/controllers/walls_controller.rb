require './lib/posts_helper'

class WallsController < ApplicationController
    include PostsHelper

    def index
        @posts = Post.where(user_id: current_user.id)
        @likes_posts = likes_all_posts
        @likes_comments = likes_all_comments
    end

    def show
        @user = User.find_by(id: params_id)

    end
end
