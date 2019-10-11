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

  def likes_all_comments
    @comments = Comment.all
    @likes = Like.all
    @likes_comments = {}
    @comments.each do |comment|
      like_counter = 0
      @likes.where(comment_id: comment.id).each do |like|
        like_counter += 1
      end
      @likes_comments[comment.id] = like_counter
    end
    return @likes_comments
  end
end
