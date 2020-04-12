Rails.application.routes.draw do
  get '/' => 'users#index'
  get 'secrets/index'
  get 'sessions/new'
  post '/sessions' => "sessions#create"
  delete '/sessions' => "sessions#destroy"
  get 'users/new' => "users#new"
  post '/users' => "users#create"
  post '/secrets' => "secrets#create"
  delete '/secrets/:secretid' => "secrets#destroy"
  get '/secrets' => "secrets#index"
  patch '/users/:userid' => "users#update"
  get '/users/show/:userid' => "users#show"
  post '/likes/:secretid' => "likes#create"
  delete '/likes/:secretid' => "likes#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions, :secrets, :likes
end
