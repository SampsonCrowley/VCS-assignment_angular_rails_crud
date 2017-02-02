Rails.application.routes.draw do
  root 'angular#index'

  scope :api do 
    scope :v1 do 
      resources :pins
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
