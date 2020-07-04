Rails.application.routes.draw do
  devise_for :users, controllers:{sessions: 'users/sessions',  registrations: 'users/registrations',}
  devise_scope :user do
    get 'streetaddress', to: 'users/registrations#new_steetaddress'
    post 'streetaddress', to: 'users/registrations#create_streetaddress'
    get 'deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
    post 'deliveryaddresses',to: 'users/registrations#create_deliveryaddresses'
  end

  root 'products#index'

  resources :credit_cards, only: [:new, :create, :show, :destroy] 

  resources :users, only: [:index, :show] do
    member do
      get 'log_out', to: 'users#log_out'
    end
  end
 
  resources :orders, only: [:show] do
    member do
      get 'done', to: 'orders#done'
      post 'pay', to: 'orders#pay'
    end
  end

  resources :products do
    collection do
      get :search
    end
  end
  
  resources :products, only: [:new, :create, :show, :destroy, :edit]

  Rails.application.routes.draw do
    root "products#show"
    resources :products
  end
  resources :products, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :categories, only: [:index, :show]

  resources :comments, only:[:create,:update,:destroy] do
    member do
      get 'restore'
    end
  end

  resources  :products do
    resources :favorites , only: [:index, :create, :destroy]
  end
 
end
