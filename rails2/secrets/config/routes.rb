Rails.application.routes.draw do
  get 'users/new'

  get 'users/show'
  get 'users/edit'
  get '/logout' => 'sessions#destroy'
  delete '/users/:userid' => "users#destroy"
  get 'users/:userid/edit' => "users#edit"
  patch '/users/:userid' => "users#update"
  get 'sessions/new' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions
end
