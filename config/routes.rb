Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  # Products
  resources :products
  # Checkout Product
  post "checkout/create", to: "checkout#create"
  # Webhooks
  resources :webhooks, only: [:create]

end
