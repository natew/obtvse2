Obtvse::Application.routes.draw do

  # Admin
  get '/admin' => 'posts#admin', as: 'admin'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get '/posts(.:format)' => 'posts#index'
  get '/posts.rss' => 'posts#index', as: 'rss'

  resources :users
  resources :sessions
  resources :posts, path: '/', param: :slug

  get '/:slug' => 'posts#show', as: 'post_slug'

  root to: 'posts#index'

  # Sitemap
  get "sitemap/sitemap.xml" => "sitemap#index", as: "sitemap", defaults: { format: "xml" }
end
