# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'items#index'

  resources :items
  resources :users, only: %i[new create]

  namespace :admin do
    resources :users
    resources :items
  end

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
