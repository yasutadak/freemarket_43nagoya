Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :users do
    resource :logout
    resource :identification
    resource :profile
  end
  resources :products
end
