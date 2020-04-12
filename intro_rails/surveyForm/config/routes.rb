Rails.application.routes.draw do
  get "" => "users#index"
  post "/send" => "users#configure"
  get "/show" => "users#result"
end
