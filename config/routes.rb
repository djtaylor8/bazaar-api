Rails.application.routes.draw do
  resources :categories
  resources :comments
  resources :cart_products
  resources :carts
  resources :products
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
