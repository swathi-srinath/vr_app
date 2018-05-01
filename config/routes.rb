Rails.application.routes.draw do
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:update, :show]
  resources :carts, only: [:show]
  resources :products, only: [:index, :show]
  root 'products#index'
  get '/checkout', to: "orders#checkout"  
end
