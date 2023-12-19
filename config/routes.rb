Rails.application.routes.draw do
  get 'users/home'
  get 'reservations/show'
  get 'reservations/create'
  get 'reservations/myreservation'
  get 'home/create'
  get "users/show"
  get "users/index"
  get "rooms/index"
  get "rooms/show"
  get "rooms/myroom"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/users/edit/', to: 'users/registrations#edit', as: 'edit_user_with_pageid'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users
  resources :rooms do
    collection do
      get 'search'
    end
  end
  resources :reservations
end
