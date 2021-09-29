Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :categories
      resources :comments
      resources :cart_products
      resources :carts
      resources :products
      resources :users
    end
  end
end
