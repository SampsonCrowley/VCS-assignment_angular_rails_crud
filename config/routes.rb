Rails.application.routes.draw do
  get 'pins/index'

  get 'pins/show'

  get 'pins/create'

  get 'pins/update'

  get 'pins/destroy'

  root 'angular#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
