Rails.application.routes.draw do
  get "users/show"
  get "users/index"
  get "rooms/index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'resevations#home'
  resources :users
  resources :rooms
  resources :resevations
end
