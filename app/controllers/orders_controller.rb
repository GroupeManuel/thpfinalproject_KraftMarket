class OrdersController < ApplicationController

  def create
    #Variable to recall the item purchased
    purchased_item = Item.find(params[:order][:item_id])
    cart = purchased_item.cart
    buyer = cart.buyer
   
   # Amount of the order in cents
    amount = (purchased_item.price*100).to_i
 
    begin

    #Create a customer in the Stripe database
    if buyer.stripe_id == nil
      stripe_customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :source  => params[:stripeToken]
     )
      buyer.update(stripe_id:stripe_customer.id)
    end
    
    #Charge the customer
    charge = Stripe::Charge.create(
       :customer    => buyer.stripe_id,
       :amount      => amount,
       :description => 'Charge #{@cart.buyer.email}(@cart.buyer_id) for item #{@purchased_item.id}',
       :currency    => 'eur',
       :metadata    => {purchased_item:purchased_item.id, buyer:cart.buyer_id}
     )

    #Rescue in case of payment error
    rescue Stripe::CardError => e
    # Since it's a decline, Stripe::CardError will be caught
      body = e.json_body
      err  = body[:error]

      puts "Status is: #{e.http_status}"
      puts "Type is: #{err[:type]}"
      puts "Charge ID is: #{err[:charge]}"
      # The following fields are optional
      puts "Code is: #{err[:code]}" if err[:code]
      puts "Decline code is: #{err[:decline_code]}" if err[:decline_code]
      puts "Param is: #{err[:param]}" if err[:param]
      puts "Message is: #{err[:message]}" if err[:message]
      flash[:error] = e.message
      redirect_back fallback_location:cart_path(cart.id) and return

    end

    #If payment succeeded, create the order with external parameters     
    new_order = Order.create!(
      buyer_id: cart.buyer_id, 
      price: purchased_item.price,
      status:'payed',
      payment_id: charge.id
      )

    #Update with delivery and invoice information filled with the form
    new_order.update(params_order)
                  
    # Update the item to empty the cart and make it sold
    Item.find(purchased_item.id).update(cart_id: nil, order_id: new_order.id)

    flash[:notice] = "Votre commande est confirmée. Vous avez reçu un email de confirmation"
    redirect_to user_path(current_user.id)

  end

  def show
  end

  private 

  def params_order
    params.require(:order).permit(
      :delivery_entity, :delivery_street, :delivery_street2, :delivery_postcode, :delivery_city, :delivery_country, :delivery_instructions, :delivery_method, 
      :invoice_entity, :invoice_street, :invoice_street2, :invoice_postcode, :invoice_city, :invoice_country
      )
  end

  def stripe_payment
  end

end
