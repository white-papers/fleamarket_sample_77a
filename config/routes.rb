Rails.application.routes.draw do
  get 'users/show'
  get 'create_card/new'
  get 'create_card/show'
  devise_for :users, controllers:{sessions: 'users/sessions',  registrations: 'users/registrations',}
  devise_scope :user do
    get 'streetaddress', to: 'users/registrations#new_steetaddress'
    post 'streetaddress', to: 'users/registrations#create_streetaddress'
    get 'deliveryaddresses',to: 'users/registrations#new_deliveryaddresses'
    post 'deliveryaddresses',to: 'users/registrations#create_deliveryaddresses'
  end
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new]
  resources :create_cards
  resources :users, only: [:show]
end
