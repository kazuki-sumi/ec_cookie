Rails.application.routes.draw do
  root "product_categories#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :product_categories do
    resources :products, only: [:index]
  end
  resources :products, except: [:index]
  resources :users, only: [:show]
  resources :carts
end
