Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:show]
  resources :products, only: [:index, :new, :show, :create] do
    collection do
      get 'list'
    end
  end
end
