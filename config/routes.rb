Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resources :shops
  	resources :customers
  	resources :dockets
  end

  root to: 'welcome_pages#index'
end
