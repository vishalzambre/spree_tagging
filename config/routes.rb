Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin, path: Spree.admin_path do
    get '/search/tags', to: 'search#tags', as: :search_tags
  end
end
