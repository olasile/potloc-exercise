Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products
  resources :orders
  resources :cart_products
  resources :dashboard, only: [:index]
end
