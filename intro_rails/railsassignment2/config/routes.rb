Rails.application.routes.draw do
  root "blogs#index"
  # get "" => "blogs#index"
  get "blogs" => "blogs#show_all"
  post "blogs" => "blogs#create"
end
