Rails.application.routes.draw do

  root "products#index"

  # Products
  resources :products
  # Checkout Product
  post "checkout/create", to: "checkout#create"
end
