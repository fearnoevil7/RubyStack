Rails.application.routes.draw do
  get 'sessions/create'

  

  get 'comments/destroy'

  get 'events/:eventid/show' => "events#show"

  get 'events/index'
  patch "/users/:userid/update" => "users#update"
  delete "/joins/:eventid" => "joins#destroy"
  delete "/events/:eventid" => "events#destroy"
  get '/joins/:eventid' => "joins#create"
  get 'users/:userid/edit' => "users#edit"
  get 'users/new'
  post '/events/:userid' => 'events#create'
  delete '/sessions/destroy' => "sessions#destroy"
  post '/events' => "events#index"
  post '/sessions/create' => "sessions#create"
  post '/comments/:userid/:eventid' => "comments#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :events, :comments, :joins
end
