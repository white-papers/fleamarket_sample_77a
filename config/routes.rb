Rails.application.routes.draw do
  devise_for :users, controllers:{sessions: 'users/sessions',  registrations: 'users/registrations',}
  devise_scope :user do
    get 'streetaddress', to: 'users/registrations#new_steetaddress'
    post 'streetaddress', to: 'users/registrations#create_streetaddress'
    get 'deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
    post 'deliveryaddresses',to: 'users/registrations#create_deliveryaddresses'
  end
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :credit_cards, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show] do
    collection do
      get 'log_out', to: 'users#log_out'
    end
  end
 
  resources :orders, only: [:new]
  resources :products, only: [:new, :create, :show, :destroy, :edit]

  Rails.application.routes.draw do
    root "products#show"
    resources :products
  end
end
