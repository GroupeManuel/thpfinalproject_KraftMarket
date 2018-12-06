class CartsController < ApplicationController
  def new
  end

  def create

      # Create a cart with the id of the current_user as a buyer

    if current_user
      if Cart.find_by(buyer_id: current_user.id) == nil
        @cart = Cart.create!(buyer_id: current_user.id)
        session[:cart] = @cart.id

        @item = Item.find(session[:item_id])

        @item.update(cart_id: @cart.id)

        redirect_to cart_path(@cart.id)
      else
        @cart = Cart.find_by(buyer_id: current_user.id)
        flash[:notice] = "Votre panier est déjà rempli"
        redirect_to item_path(session[:item_id])
      end
    else
      flash[:notice] = "Vous devez être connecté pour commander un article"
      redirect_to new_user_registration_path
    end

      # Find the item using session variable and store it in a variable
    # @item = Item.find(session[:item_id])

      # Update the item to tell that it is in a cart, so it is reserved
    #@item.update(cart_id: @cart.id)
  end

  def show
      # Find the item and store it 
    @cart_item = Item.find(session[:item_id])
  end

  def destroy
    @destroy_cart = Cart.find(session[:cart])
    @destroy_cart.destroy
    redirect_to item_path(session[:item_id])
  end
end