Rails.application.routes.draw do
  get "" => "dojos#index"
  get "/addHome" => "dojos#add"
  post "/add" => "dojos#create"
end
