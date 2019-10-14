require './lib/posts_helper'

class WallsController < ApplicationController
    before_action :authenticate_user!
    include PostsHelper

    def index
        @posts = Post.all
        @likes_posts = likes_all_posts
        @likes_comments = likes_all_comments
      end
end
