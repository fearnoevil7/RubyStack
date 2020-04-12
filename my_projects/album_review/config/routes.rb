Rails.application.routes.draw do
  get 'albums/index'

  get 'albums/show'

  get 'albums/new'

  get 'users/show'

  get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
