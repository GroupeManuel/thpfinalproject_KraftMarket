class OrdersController < ApplicationController

  def create
    Order.create!(buyer_id: current_user.id, delivery_method: params_order[:delivery_method])
    redirect_to root_path
  end

  def show
    
  end

  private 

  def params_order
    params.require(:order).permit(:delivery_method)
  end

end
