# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'

  resources :items

  namespace :admin do
    resources :items
  end

  get '/cart', to: 'cart_details#index'
  put '/add_cart', to: 'cart_details#update'
  delete '/remove_cart', to: 'cart_details#destroy'

  put '/checkout', to: 'cart_details#checkout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
