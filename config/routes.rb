Rails.application.routes.draw do

  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
}

  devise_scope :user do
    get  'membership/new',    :to => "membership#new"
    post 'membership/create', :to => "membership#create"
    get  'phone/new',         :to => "phone#new"
    post 'phone/create',      :to => "phone#create"
    get  'address/new',       :to => "address#new"
    post 'address/create',    :to => "address#create"
    get  'credit/new',        :to => "credit#new"
    post 'credit/create',     :to => "credit#create"
  end

  root 'products#index'
  resources :users
  resources :products
end
