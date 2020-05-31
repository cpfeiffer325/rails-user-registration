Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  resources :users, only: [:index, :new, :create, :show] do
    member do
      get 'confirm_email'
    end
  end
  
  root 'welcome#index'
end
