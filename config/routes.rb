# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wish_lists do
    resources :items
  end
  resources :products
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
