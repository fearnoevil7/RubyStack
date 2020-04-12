Rails.application.routes.draw do
  get "" => "dojos#index"
  get "/dojoDashboard/:id" => "dojos#dojoDashboard"
  get "/:dojoid/:studentid/students/new" => "students#studentDashboard"
  get "/add/:dojoid/" => "students#add"
  post "/create/:dojoid" => "students#newUser"
  get "/edit/:dojoid/:studentid" => "students#edit"
  patch "/update/:dojoid/:studentid" => "students#update"
  delete "/destroy/:dojoid/:studentid" => "students#destroy"
end
