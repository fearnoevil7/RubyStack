Rails.application.routes.draw do
  get "" => "users#start"
  get "users" => "users#show_all"
  get "users/new" => "users#add"
  get "users/total" => "users#total"
  post "users/create" => "users#create"
  get "users/:id" => "users#view"
  get "users/:id/edit" => "users#editHome"
end
