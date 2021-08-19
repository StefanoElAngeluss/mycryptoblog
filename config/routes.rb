Rails.application.routes.draw do

  devise_for :users, controllers: {
    :registrations => "users/registrations" }

  root "products#index"

  # Posts
  resources :posts
  get "prix", to: "static_pages#prix"
  # Checkout subscription Post
  post "subscription/create", to: "subscription#create", as: "subscription_create"
  post "billing_portal/create", to: "billing_portal#create", as: "billing_portal_create"

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
