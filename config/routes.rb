Rails.application.routes.draw do

    # Controller Static
  get '/', to: 'static#home_buyer', as: 'root'
  get 'bienvenue-ravitailleur', to: 'static#home_seller', as: 'home_seller'

  get 'a-propos', to: 'static#about', as: 'about'
  get 'contact', to: 'static#contact', as: 'contact'

    # Controller Item

  resources :items
  get 'nouvel-objet/etape1', to: 'items#new'
  get 'nouvel-objet/etape2', to: 'items#optimization', as: 'item_optimize'
  get 'nouvel-objet/confirmation', to: 'items#thanks', as: 'item_thanks'

    # Controller User via Devise

  devise_for :users

  #Controller Order
  resources :orders, only: [:create, :show]
  get 'confirmation-commande', to: 'orders#thanks', as: 'order_thanks'


  # Controller Cart
  resources :carts, only: [:show]

end
