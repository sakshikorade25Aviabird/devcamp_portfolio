Rails.application.routes.draw do
  resources :categories
  resources :portfolios

  get 'about-me', to: 'pages#about'
  get 'contact_lol', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   
  root to: 'pages#home'


end
