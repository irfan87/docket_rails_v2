Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resources :shops
  	resources :customers
  end

  root to: 'shops#index'
end
