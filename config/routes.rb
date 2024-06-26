# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'

  resources :items
  resources :orders
  resources :carts, only: %i[update show]

  namespace :admin do
    resources :items
  end

  put '/add_cart', to: 'cart_details#update'
  delete '/remove_cart', to: 'cart_details#destroy'

  put '/checkout', to: 'carts#destroy'

  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
