Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#home'
  resources :cars do
    resources :rentals
  end

  post 'cars/search', to: 'cars#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
