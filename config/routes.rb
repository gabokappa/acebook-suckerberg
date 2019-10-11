Rails.application.routes.draw do
  devise_for :user, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "home#index"
  #index"
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end

  get 'likeposts', to: 'likes#create_no_form_posts', as: :likeposts
  get 'likecomments', to: 'likes#create_no_form_comments', as: :likecomments
    
  resources :posts
  resources :comments
  resources :likes
end
