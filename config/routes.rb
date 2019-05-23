Rails.application.routes.draw do
  devise_for :adminUsers, path: 'admin'
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :users do
    # match :login, on: :collection, via: [:get, :post]
  end

  match '/login', to: 'sessions#login', via: [:get, :post]
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/home', to: 'home#index'
    get '/users', to: 'users#index'
  end
end
