Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "sites#index"
  resources :sites, except: :index do
    resources :guilds, only: [:show, :new, :create] do
    end
  end
  resources :guilds, only: :destroy do
    resources :site_plants, only: [:new, :create]
  end
end
