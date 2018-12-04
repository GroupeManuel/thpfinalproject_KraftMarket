Rails.application.routes.draw do

    # Controller Static

  root 'static#home_buyer'
  get 'static/home_seller'
  get 'static/about'
  get 'static/contact'

    # Controller Item

  resources :items
  get 'items/optimization'
  get 'items/thanks'

    # Controller User via Devise

  devise_for :users

    # Controller Order

  resources :orders, only: [:create, :show]

    # Controller Cart

  resources :carts, only: [:show]

end
