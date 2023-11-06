Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products
  resources :orders do
    collection do
      get :notifications
    end
  end
  resources :cart_products
end
