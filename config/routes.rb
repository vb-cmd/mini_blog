Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  get 'sitemap.xml', to: 'sitemap#index', as: 'sitemap'
  get 'sitemap_posts.xml', to: 'sitemap#posts', as: 'sitemap_posts'
  get 'sitemap_categories.xml', to: 'sitemap#categories', as: 'sitemap_categories'
  get 'sitemap_pages.xml', to: 'sitemap#pages', as: 'sitemap_pages'

  resources :pages, only: %i[show]

  get 'search', to: 'search#index', as: 'search'

  get 'categories/:id', to: 'categories#show', as: 'category'
  get 'categories/:id/page/:page', to: 'categories#show', as: 'categories_page'

  resources :posts, only: %i[show index] do
    get 'page/:page', action: :index, on: :collection
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
