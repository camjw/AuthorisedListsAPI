# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :wish_lists do
      resources :items
    end
  end 
  resources :wish_lists do
    resources :items
  end
  resources :items
end
