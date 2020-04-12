Rails.application.routes.draw do
  get "" => "says#index"
  get "hello" => "users#greetings"
  get "say/hello" => "users#say"
  get "say/hello/joe" => "users#joe"
  get "times" => "users#tiempo"
  get "times/restart" => "users#restart"
  get "say/hello/michael" => "users#hi"
end