require 'rails_helper'

describe LikesController, type: :controller do
  describe 'GET /new ' do
    login_user
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    login_user
    it 'creates a like for a post' do
      new_post = FactoryBot.create(:post)
      # allow(:create).to receive(:find_post_wall) { 1 }
      post :create, params: { like: { liked: 1, post_id: 1}, wall_id: 1}
      expect(Like.all[0]).to be
      DatabaseCleaner.clean
    end
  end
  describe 'POST /' do
    login_user
    it 'creates a like for a comment' do
      new_comment = FactoryBot.create(:comment)
      post :create, params: { like: { liked: 1 , comment_id: new_comment.id}}
      DatabaseCleaner.clean
    end
  end

  describe 'POST /' do
    login_user
    it 'creates a like for a post without form' do
      new_post = FactoryBot.create(:post)
      get :create_no_form_posts, params: { post_id: new_post.id}
      expect(Like.all[0]).to be
      DatabaseCleaner.clean
    end
  end

  describe 'POST /' do
    login_user
    it 'creates a like for a comment without form' do
      new_comment = FactoryBot.create(:comment)
      get :create_no_form_comments, params: { comment_id: new_comment.id }
      expect(Like.all[0]).to be
      DatabaseCleaner.clean
    end
  end


end
