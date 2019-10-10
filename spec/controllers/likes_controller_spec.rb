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
    it "creates a like" do
      post :create, params: { like: { liked: 1 } }
      p @like
      p Like.all
      p Like.all[0]
      # expect(Like.all[0]).to be
      expect(Like.find_by(liked: 1)).to be

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
