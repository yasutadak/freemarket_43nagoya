Rails.application.routes.draw do
  root 'products#index'
  resources :users
  resources :products
end
