Rails.application.routes.draw do
  get '/' => "users#new"

  get 'comments/create'

  get 'comments/destroy'

  
  get 'joins/destroy'
  
  get 'sessions/create'
  
  get 'sessions/destroy'
  
  get 'users/edit'
  
  get 'events/' => "events#index"
  
  get 'events/:eventid' => "events#show"
  get 'joins/:eventid' => "joins#create"
  delete 'joins/:eventid' => "joins#destroy"
  post '/events' => "events#create"
  post '/comments/:eventid' => "comments#create"
  delete '/sessions' => "sessions#destroy"
  delete '/events/:eventid' => "events#destroy"
  post '/sessions' => "sessions#create"
  patch '/users/:userid' => "users#update"
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :events, :joins, :comments, :sessions
end
