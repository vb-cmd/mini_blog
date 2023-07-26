Rails.application.routes.draw do
  scope module: :blog do
    root 'posts#index', as: 'home'
    resources :user_profiles, only: %i[show]
    get 'sitemap', to: 'sitemap#index', as: 'sitemap', format: :xml
    get 'search', to: 'search#index', as: 'search'
    get 'categories/:id', to: 'categories#show', as: 'category'
    get 'categories/:id/page/:page', to: 'categories#show', as: 'categories_page'

    resources :pages, only: %i[show]
    resources :posts, only: %i[show index] do
      match :likes, to: 'likes#update', via: %i[patch put]
      post :comments, to: 'comments#create'
      get 'page/:page', action: :index, on: :collection
    end
  end

  namespace :admin do
    get '/', to: 'dashboards#index'
    get 'statistics', to: 'dashboards#statistics'
    resources :comments
    resources :users do
      get 'posts', to: 'users#posts'
      get 'comments', to: 'users#comments'
    end
    resources :pages

    resources :categories do
      get 'posts', to: 'categories#posts'
    end
    resources :posts do
      get 'comments', to: 'posts#comments'
    end
  end

  devise_for :users
end
