Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :admins
  devise_for :users
  root 'pages#home'
  resources :cars do
    resources :rentals
  end

  post 'cars/search', to: 'cars#search'
  get 'pages/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
