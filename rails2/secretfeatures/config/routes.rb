Rails.application.routes.draw do
  get 'secrets/index'

  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get '/logout' => 'sessions#destroy'
  delete '/secrets/:secretid' => 'secrets#destroy'
  delete '/users/:userid' => "users#destroy"
  post '/secrets/:userid' => "secrets#create"
  get 'users/:userid/edit' => "users#edit"
  patch '/users/:userid' => "users#update"
  get 'sessions/new' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#index'
  get '/secrets' => "secrets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions, :secrets, :likes
end
