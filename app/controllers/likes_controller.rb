class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.create(post_params)
    redirect_to posts_url
  end

  def create_no_form_posts
    if Like.all.where(post_id: params[:post_id], user_id: current_user.id).length == 0
      @like = Like.create({ liked: 1 , post_id: params[:post_id], user_id: current_user.id})
    else
       Like.all.where(post_id: params[:post_id], user_id: current_user.id).destroy_all
     end
    redirect_to posts_url
  end

  def create_no_form_comments
    if Like.all.where(comment_id: params[:comment_id], user_id: current_user.id).length == 0
      @like = Like.create({ liked: 1 , comment_id: params[:comment_id], user_id: current_user.id})
    else
       Like.all.where(comment_id: params[:comment_id], user_id: current_user.id).destroy_all
     end
    redirect_to posts_url
  end

  def index
    @like = Like.all
  end

private

def post_params
  params.require(:like).permit(:post_id, :comment_id, :liked).merge(user_id: current_user.id) #, comment_id: 1, post_id: 1 )
end


end
