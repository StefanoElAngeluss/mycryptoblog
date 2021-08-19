Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => "users/registrations" }

  root "products#index"

  # Posts
  resources :posts

  # Products
  resources :products
  # Checkout Product
  post "checkout/create", to: "checkout#create"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart" 
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"
  # Webhooks
  resources :webhooks, only: [:create]

end
