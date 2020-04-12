Rails.application.routes.draw do
  get 'index/show'

  get '/login' => "sessions#create"

  get '/sessions/destroy' => "sessions#destroy"
  
  get '/users/new' => "users#new"

  post '/users' => "users#create"

  get '/users/:userid' => "users#edit"

  patch "/users/:userid" => "users#update"

  get "/event" => "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, :event, :join, :comment
end
