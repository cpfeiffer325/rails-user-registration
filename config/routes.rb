Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'welcome/index'

  resources :users, only: [:new, :create, :show] do
    member do
      get 'confirm_email'
    end
  end
  
  root 'sessions#welcome'
end
