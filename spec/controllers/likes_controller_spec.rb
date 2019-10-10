require 'rails_helper'

describe LikesController, type: :controller do
  describe "GET /new " do
    login_user
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    login_user
    it "creates a like for a post" do
      new_post = FactoryBot.create(:post)
      # p new_post
      post :create, params: { like: { liked: 1 , post_id: new_post.id}} #, post_id: new_post.id } }#, post_id: post.id }#, post_id: post.id, comment_id: comment.id } }
      # p Like.all[0]
      expect(Like.all[0]).to be
      DatabaseCleaner.clean
    end
  end
  describe "POST /" do
    login_user
    it "creates a like for a comment" do
      new_comment = FactoryBot.create(:comment)
      # p new_comment
      post :create, params: { like: { liked: 1 , comment_id: new_comment.id}} #, post_id: new_post.id } }#, post_id: post.id }#, post_id: post.id, comment_id: comment.id } }
      # p Like.all[0]
      expect(Like.all[0]).to be
      DatabaseCleaner.clean
    end
  end
end

#
#     it "creates a post" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#     end
#   end
#
#   describe "GET /" do
#     login_user
#     it "responds with 200" do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end
# end
