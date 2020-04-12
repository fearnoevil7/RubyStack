Rails.application.routes.draw do
  get "" => "users#index"
  post "/configure" => "users#transaction"
end
