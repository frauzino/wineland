Rails.application.routes.draw do
  get 'pages/home', as: 'home'
  get 'pages/about', as: 'about'
  get 'pages/contact', as: 'contact'
  get 'pages/privacy', as: 'privacy'
  get 'pages/retailers', as: 'retailers'
  get 'pages/faq', as: 'faq'
  get 'pages/tos', as: 'tos'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
