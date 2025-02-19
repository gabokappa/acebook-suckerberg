# frozen_string_literal: true

Rails.application.routes.draw do
  resources :albums
  devise_for :user, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "home#index"
  # index"
  authenticated :user do
    root 'users#show', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  get 'destroy_post', to: 'posts#destroy_post', as: :destroy_post
  get 'destroy_comment', to: 'comments#destroy_comment', as: :destroy_comment

  get 'likeposts', to: 'likes#create_no_form_posts', as: :likeposts
  get 'likecomments', to: 'likes#create_no_form_comments', as: :likecomments

  get 'indexwall', to: 'walls#index', as: :indexwall
  get 'userswall', to: 'users#show', as: :userswall
  get 'friends', to: 'users#list', as: :friends
  match 'users/:id', to: 'users#show', via: 'get'
  get 'users/:id', to: 'users#show', as: :user_wall

  get 'destroy_album', to: 'albums#destroy', as: :destroy_album
  get 'destroy_pic', to: 'albums#destroy_pic', as: :destroy_pic

  resources :posts
  resources :comments
  resources :likes
  resources :users
end
