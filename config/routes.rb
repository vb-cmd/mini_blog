Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  get 'sitemap.xml', to: 'sitemap#index', as: 'sitemap'

  resources :pages, only: %i[show]

  get 'search', to: 'search#index', as: 'search'

  get 'categories/:id', to: 'categories#show', as: 'category'
  get 'categories/:id/page/:page', to: 'categories#show', as: 'categories_page'

  resources :posts, only: %i[show index] do
    post 'comment', action: :show, to: 'comments#new'
    get 'page/:page', action: :index, on: :collection
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
