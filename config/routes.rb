Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  scope module: :blog do
    root 'posts#index', as: 'home'
    resources :authors, only: %i[show]
    get 'sitemap', to: 'sitemap#index', as: 'sitemap', format: :xml
    get 'search', to: 'search#index', as: 'search'
    resources :categories, only: %i[show] do
      member do
        get '/page/:page', to: 'categories#show', as: 'page'
      end
    end
    resources :pages, only: %i[show]
    resources :posts, only: %i[show index] do
      match :likes, to: 'likes#update', via: %i[patch put]
      post :comments, to: 'comments#create'
      get 'page/:page', action: :index, on: :collection
    end
  end
end
