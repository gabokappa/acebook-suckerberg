require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe 'CommentsController' do
    it 'creates a comment' do
      user = FactoryBot.create(:user)
      sign_in user
      post1 = FactoryBot.create(:post)
      post :create, params: { comment: {message: 'Hello, like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
      expect(Comment.all[0]).to be
    end
  end

  describe 'CommentsController' do
    it 'destroys a comment' do
      user = FactoryBot.create(:user)
      sign_in user
      post1 = FactoryBot.create(:post)
      post :create, params: { comment: {message: 'Hello, like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
      expect(Comment.all[0]).to be
      get :destroy_comment, params: {id: Comment.all[0].id}
      expect(Comment.all[0]).to_not be
    end
  end

  describe 'PUT #update' do
    skip do
      it 'updates the requested comment' do
        user = FactoryBot.create(:user)
        sign_in user
        post1 = FactoryBot.create(:post)
        post :create, params: { comment: {message: 'Hello, like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
        put :update, params: { comment: { id: Comment.all[0].id, message: 'test_change', user_id: user.id } }
        expect(Comment.all[0].message).to eq('test_change')
      end
    end
  end

  describe 'GET #edit' do
    login_user
    it 'changes the requested comment' do
      user = FactoryBot.create(:user)
      sign_in user
      post1 = FactoryBot.create(:post)
      post :create, params: { comment: {message: 'Hello, like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
      get :edit, params: {id: Comment.all[0].id, message: 'test_change'}
      expect(response).to be_successful
    end
  end

  describe 'likes_all_comments' do
    login_user
    it 'responds with correct hash' do
      user = FactoryBot.create(:user)
      sign_in user
      post1 = FactoryBot.create(:post)
      post :create, params: { comment: {message: 'Hello, like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
      Like.create(comment_id: Comment.all[0].id, liked:1, user_id: user.id)
      post :create, params: { comment: {message: 'Hello, no like!', wall_id: 1, user_id: post1.user.id, post_id: post1.id, post_test: post1.id }}
      expect(likes_all_comments[Comment.all[0].id]).to eq(1)
      expect(likes_all_comments[Comment.all[1].id]).to eq(0)
    end
  end
end
