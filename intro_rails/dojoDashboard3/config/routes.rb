Rails.application.routes.draw do
  get "" => "dojos#index"
  get "/newdojo" => "dojos#addHome"
  get "/editHome/:id" => "dojos#configure"
  get "/look/:id" => "dojos#show"
  delete "/basura/:id" => "dojos#trash"
  patch "/update/:id" => "dojos#update"
  post "/nuevo" => "dojos#add"
end
