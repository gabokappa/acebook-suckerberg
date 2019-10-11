module PostsHelper
  def likes_all_posts
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
    return @likes_posts
  end
end
