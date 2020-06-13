Rails.application.routes.draw do
  get 'confirm/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :show] do
    # member do
    #   get 'confirm_email'
    # end
  end

  resources :confirm, only: [:index]
  
  root 'sessions#welcome'
end
