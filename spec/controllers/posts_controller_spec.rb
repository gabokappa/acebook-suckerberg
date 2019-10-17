# frozen_string_literal: true
require 'rails_helper'
require './lib/posts_helper'
include PostsHelper


describe PostsController, type: :controller do
  describe 'GET /new ' do
    login_user
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    login_user
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!', wall_id: 1 } }
      expect(response).to redirect_to('/users/1')
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!', wall_id: 1 } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    login_user
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'likes_all_posts' do
    login_user
    it 'responds with correct hash' do
      user = FactoryBot.create(:user)
      post :create, params: { post: { message: 'Hello, like!', wall_id: 1 } }
      like = FactoryBot.create(:like)
      expect(likes_all_posts[1]).to eq(1)
      expect(likes_all_posts[Post.all[0].id]).to eq(0)
    end
  end
end
