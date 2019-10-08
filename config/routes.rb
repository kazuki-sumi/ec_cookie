Rails.application.routes.draw do
  devise_for :users
  resources :product_categories do
    resources :products, only: [:index]
  end
  resources :products, except: [:index]
  resources :users
  resources :carts
end
