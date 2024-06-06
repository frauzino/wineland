Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'pages#home'

  resources :retailers, except: [:show]
  resources :products

  get 'pages/home', as: 'home'
  get 'pages/about', as: 'about'
  get 'pages/contact', as: 'contact'
  get 'pages/privacy', as: 'privacy'
  get 'pages/faq', as: 'faq'
  get 'pages/tos', as: 'tos'

end
