Rails.application.routes.draw do
  # Web Routes
  get "home/index"
  resources :users
  resources :items
  resources :menus
  resources :reviews
  resources :posts

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
  
  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route
  root to: 'home#index'
  devise_for :users

  # API Routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :menus, only: [:index, :show, :create, :update, :destroy]
      resources :reviews, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
