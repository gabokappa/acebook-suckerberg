class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.create(post_params)
    redirect_to likes_url
  end

  def index
    @like = Like.all
  end

private

def post_params
  params.require(:like).permit(:liked) #.merge(user_id: current_user.id) #, comment_id: 1 post_id: 2 )
end


end
