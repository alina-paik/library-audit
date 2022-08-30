Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'

  resources :books
  resources :categories
  resources :authors
end
