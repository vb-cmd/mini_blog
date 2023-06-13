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
    resources :comments
    namespace :admin_users do
      get '/edit', action: 'edit'
      delete '/destroy', action: 'destroy'
      get '/show', action: 'show'
      match '/update', action: 'update', via: %i[put patch]
    end
    resources :admin_users, only: %i[index new create]
    resources :categories, except: %i[show] do
      get 'posts', to: 'posts#category_posts'
    end
    resources :posts, except: %i[show] do
      get 'comments', to: 'comments#post_comments'
    end
    resources :pages, except: %i[show]
  end

  devise_for :admin_users
end
