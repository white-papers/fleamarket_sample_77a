Rails.application.routes.draw do
  devise_for :users, controllers:{sessions: 'users/sessions',  registrations: 'users/registrations',}
  devise_scope :user do
    get 'streetaddress', to: 'users/registrations#new_steetaddress'
    post 'streetaddress', to: 'users/registrations#create_streetaddress'
    get 'deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
    post 'deliveryaddresses',to: 'users/registrations#create_deliveryaddresses'
  end

  root 'products#index'

  resources :credit_cards, only: [:new, :create, :show, :destroy] do
    post :pay, on: :member 
  end

  resources :users, only: [:index, :show] do
    collection do
      get 'log_out', to: 'users#log_out'
    end
  end
 
  resources :orders, only: [:index] do
    collection do
      get 'done', to: 'orders#done'
      post 'pay', to: 'orders#pay'
    end
  end
  resources :products, only: [:new, :create, :show]
end
