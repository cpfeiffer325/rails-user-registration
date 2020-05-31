Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create, :show] do
    member do
      get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'
    end
  end
end
