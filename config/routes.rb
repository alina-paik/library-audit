# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'
  post '/books/:id/comments', to: 'comments#create'
  get '/books/:id/comments', to: 'comments#index'
  put '/books/:id/comments/:id', to: 'comments#update'
  delete '/books/:id/comments/:id', to: 'comments#destroy'
  post '/authors/invite', to: 'authors#invite_author'
  post 'books/:id/authors', to: 'books#add_author'
  delete 'books/:id/authors', to: 'books#remove_author'
  resources :books
  resources :categories
  resources :authors

end
