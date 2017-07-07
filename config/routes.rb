Rails.application.routes.draw do
  
  resources :products
  root 'welcome#index'

  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end