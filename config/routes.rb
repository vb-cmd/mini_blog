Rails.application.routes.draw do
  scope module: :blog do
    root 'posts#index', as: 'home'

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
    resources :comments, only: %i[edit update new create destroy show]
    resources :categories, only: %i[edit update new create destroy]
    resources :posts, only: %i[edit update new create destroy]
    resources :pages, only: %i[edit update new create destroy]
  end

  devise_for :admin_users
end
