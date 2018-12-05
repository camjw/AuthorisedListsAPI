# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wish_lists do
    resources :items
  end
end
