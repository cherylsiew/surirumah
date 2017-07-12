Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  # resources :products
  resources :products do
      resources :purchases, only: [:new, :create, :show, :edit, :update]
  end

  resources :users do
    resources :purchases, only: [:index], as: "purchases"
  end

  resources :users do
    resources :products, only: [:index], as: "products"
  end

  resources :purchases, only: [:destroy] do
    resources :braintree, only: [:new, :create]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
