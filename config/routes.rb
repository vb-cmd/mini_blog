Rails.application.routes.draw do
  scope module: :blog do
    root 'posts#index', as: 'home'
    get 'profile/:name', to: 'admin_user_profiles#show', as: 'profile'
    get 'sitemap', to: 'sitemap#index', as: 'sitemap', format: :xml
    get 'search', to: 'search#index', as: 'search'
    get 'categories/:id', to: 'categories#show', as: 'category'
    get 'categories/:id/page/:page', to: 'categories#show', as: 'categories_page'
    
    resources :pages, only: %i[show]
    resources :posts, only: %i[show index] do
      post 'comment', action: :show, to: 'comments#new'
      get 'page/:page', action: :index, on: :collection
    end
  end
  
  namespace :admin do
    get '/', to: 'dashboards#home'
    resources :comments
    resources :admin_users do
      get 'posts', to: 'admin_users#posts'
    end
    resources :pages
    
    resources :categories do
      get 'posts', to: 'categories#posts'
    end
    resources :posts do
      get 'comments', to: 'posts#comments'
    end
  end

  devise_for :admin_users
end
