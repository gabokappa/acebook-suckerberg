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
  params.require(:like).permit(:liked, :post_id, :comment_id).merge(user_id: current_user.id) #, comment_id: 1, post_id: 1 )
end


end
