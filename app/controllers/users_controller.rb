class UsersController < ApplicationController

  def show
  	@user = current_user
  end

  def update
  	current_user.update(user_params)
  	redirect_to user_path(current_user.id)
  end


  private

  def user_params
  	params[:user].permit(:email, :first_name, :last_name, :phone_number, :activity, :company_name, :company_ID_number, :company_description, :invoice_entity, :invoice_street, :invoice_street2, :invoice_postcode, :invoice_city, :invoice_country, :delivery_entity, :delivery_street, :delivery_street2, :delivery_postcode, :delivery_city, :delivery_country, :delivery_instructions)
  end

end
