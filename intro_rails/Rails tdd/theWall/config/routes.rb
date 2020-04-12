Rails.application.routes.draw do
  get 'messages/new'

  get 'users/new'
  get '/logout' => "users#logout"
  post "/users/add" => "users#create"
  post "/messages/add/:userid" => "messages#create"
  post "/messages/:userid/:messageid" => "comments#create"
  get "/messages/:userid" => "messages#index"
  resource :users, :messages
end
resources :users
