Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:show, :edit, :update]
  resources :products, only: [:show, :create]
end
