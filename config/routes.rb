Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'pages#home'

  resources :retailers, except: [:show]
  resources :products
  resources :markets
  resources :contact, only: [:new, :create]
  resources :users, only: [:show]

  get 'pages/home', as: 'home'
  get 'pages/about', as: 'about'
  get 'pages/privacy', as: 'privacy'
  get 'pages/faq', as: 'faq'
  get 'pages/tos', as: 'tos'
end
