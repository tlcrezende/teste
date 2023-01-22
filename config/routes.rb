require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :books
      resources :user_books, only: [:index, :create, :destroy]
      resources :reviews, only: [:index, :create]
      get '/reviews/book/:id' => 'reviews#index_book'
      get '/reviews/user/:id' => 'reviews#index_user'
      get 'recommendation' => 'recommendation#first'
      get 'other_recommendation' => 'recommendation#other'
    end
  end
end
