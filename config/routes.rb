Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: :show do
    resource :logout, only: :show
    resource :identification, only: [:edit, :update]
    resource :profile, only: [:edit, :update, :show]
  end
  resources :products, only: [:index, :new, :show] do
    collection do
      get 'list'
    end
  end
end
