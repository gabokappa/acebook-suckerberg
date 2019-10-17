require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

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
