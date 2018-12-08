class CartsController < ApplicationController
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
        flash[:notice] = "Vous avez déjà un objet réservé"
        redirect_back fallback_location: cart_path(cart.id)
      end
    else
      flash[:notice] = "Vous devez être connecté pour commander un article"
      redirect_to new_user_registration_path
    end

  end

  def show
    # Find the item corresponding the the cart 
    @cart_item = current_user.cart.item
    @cart = Cart.find(params[:id])

    @order = Order.new
  end

  # Remove cart_id from the item to empty the cart
  def update
    Item.find(params[:item_id]).update(cart_id: nil)

    redirect_back fallback_location: item_path(params[:item_id])
  end
end