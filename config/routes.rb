# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'
  resources :items

  namespace :admin do
    resources :users
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
