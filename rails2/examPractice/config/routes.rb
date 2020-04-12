Rails.application.routes.draw do
  get '/' => "users#index"
  get '/courses' => "courses#index"

  
  get '/courses/new' => "courses#new"
  
  
  get 'users/edit'
  get '/asc' => "courses#order_asc"
  get '/desc' => "courses#order_desc"
  get 'users/index'
  post '/sessions' => "sessions#create"
  delete '/sessions' => "sessions#destroy"
  post '/users' => "users#create"
  post '/courses' => "courses#create"
  delete '/courses/:courseid' => "courses#destroy"
  get '/asc/:courseid' => "users#ascend"
  get '/desc/:courseid' => "users#descend"
  get '/courses/:courseid' => "courses#show"
  get 'courses/:courseid/edit' => "courses#edit"
  get '/joins/:courseid' => "joins#create"
  patch '/courses/:courseid' => "courses#update"
  delete '/joins/:courseid' => "joins#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :courses, :joins, :sessions
end
