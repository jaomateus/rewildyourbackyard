Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root 'sites#index', as: :user_root
  end

  root to: "pages#home"

  get "about", to: "pages#about"

  resources :sites do
    resources :logs, only: [:new, :create]
    resources :guilds, only: [:index, :show, :new, :create]
    resources :site_plants, only: [:new, :create]
  end

  resources :guilds, only: :destroy do
  end
end
