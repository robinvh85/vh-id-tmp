# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :adminUsers, path: 'admin', controllers: { sessions: 'admin/sessions' }
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :products

  namespace :admin do
    get '/home', to: 'home#index'
    get '/home', to: 'home#index'
    get '/users', to: 'users#index'
  end
end
