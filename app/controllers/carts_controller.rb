class CartsController < ApplicationController

  include CartsHelper

  def new
  end

  def create

    # Create a cart with the id of the current_user as a buyer
    if current_user
      cart = current_user.cart

      #Case empty cart > 

      if cart.item == nil
        Item.find(params[:item_id]).update(cart_id:current_user.cart.id)

        redirect_to cart_path(cart.id)
      else
        flash[:error] = "Vous avez déjà un objet réservé ! Veuillez finaliser votre commande ou l'annuler."
        redirect_to cart_path(cart.id)
      end
    else
      # New session variable to remember the page the user wants to see after sign in success
      session[:draft_cart_id] = Item.find(params[:item_id]).id

      flash[:error] = "Vous devez être connecté pour commander un article"
      redirect_to new_user_session_path
    end

  end

  def show

    unless cart_owner_checked
      redirect_back fallback_location: user_path(current_user.id)
    end
    # Find the item corresponding the the cart 
    @cart_item = current_user.cart.item
    @cart = Cart.find(params[:id])

    @order = Order.new
  end

  # Remove cart_id from the item to empty the cart
  def update
    Item.find(params[:item_id]).update(cart_id: nil)

    flash[:notice] = "Votre commande a bien été annulée."
    redirect_to items_path
  end
end