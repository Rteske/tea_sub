Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subscriptions, only: [:create, :destroy]
  resources :teas, only: :index
end
