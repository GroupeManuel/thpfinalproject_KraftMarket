class CartsController < ApplicationController
  def new
  end

  def create

      # Create a cart with the id of the current_user as a buyer

    if Cart.find_by(buyer_id: current_user.id) == nil
      @cart = Cart.create!(buyer_id: current_user.id)
      session[:cart] = @cart.id
      redirect_to cart_path(@cart.id)
    else
      @cart = Cart.find_by(buyer_id: current_user.id)
      flash[:notice] = "Votre panier est déjà rempli"
      redirect_to item_path(session[:item_id])
    end

      # Find the item using session variable and store it in a variable
    @item = Item.find(session[:item_id])

      # Update the item to tell that it is in a cart, so it is reserved
    @item.update(cart_id: @cart.id)
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