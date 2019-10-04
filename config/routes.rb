Rails.application.routes.draw do
  resources :category do
    resources :products, only: [:index]
  end
  resources :products, except: [:index]
  resources :users
  resources :carts
end
