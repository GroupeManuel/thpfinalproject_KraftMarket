Rails.application.routes.draw do

  get '/', to: 'static#home_buyer', as: 'root'
  get 'bienvenue-ravitailleur', to: 'static#home_seller', as: 'home_seller'
  get 'a-propos', to: 'static#about', as: 'about'

    # Controller Item

  resources :items

    # Controller User via Devise

  devise_for :users
  resources :users, only: [:show, :update, :edit]
  get 'users/public_profile/:id', to: 'users#public_profile', as: 'public_profile'

    #Controller Order

  resources :orders, only: [:create, :show]
  get 'confirmation-commande', to: 'orders#thanks', as: 'order_thanks'

    # Controller Cart

  resources :carts, only: [:show, :create, :update]

    # Controller Message
    
  resources :contacts, only: [:new, :create]
  
end
