Rails.application.routes.draw do
  get 'reservations/home'
  get 'reservations/show'
  get 'reservations/create'
  get 'home/create'
  get "users/show"
  get "users/index"
  get "rooms/index"
  get "rooms/show"
  get "rooms/myroom"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reservations#home'
  resources :users
  resources :rooms
  resources :reservations
end
