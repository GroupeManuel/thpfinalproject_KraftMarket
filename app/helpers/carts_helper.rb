module CartsHelper

    def cart_owner_checked
      requested_user = Cart.find(params[:id]).buyer
  
      if user_signed_in? && requested_user == current_user
        true
      else
        false
      end
  
    end

end
