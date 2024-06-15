Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#home'

  resources :retailers, except: %i[show]
  resources :products
  resources :markets
  resources :contact, only: %i[new create]
  resources :users, only: %i[show]
  resources :orders, except: %i[new edit update]
  resource :cart, only: %i[show]

  post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  get 'pages/home', as: 'home'
  get 'pages/about', as: 'about'
  get 'pages/privacy', as: 'privacy'
  get 'pages/faq', as: 'faq'
  get 'pages/tos', as: 'tos'
end
