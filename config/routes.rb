Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'sites#index', as: :user_root
  end

  root to: "pages#home"

  get "about", to: "pages#about"

  resources :sites do
    member do
      get :dashboard
    end
    resources :logs, only: [:new, :create]
    resources :guilds, only: [:index, :show, :new, :create]
    resources :site_plants, only: [:new, :create]
  end

  resources :guilds, only: :destroy do
  end
end
