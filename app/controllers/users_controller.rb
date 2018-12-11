class UsersController < ApplicationController

  before_action :set_user
  before_action :user_sales, :user_orders, :user_section, only:[:show]

  def show
  end

  def edit

  end

  def update
  	@user.update(user_params)
  	redirect_back fallback_location: user_path(@user.id)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  #extract of all params before updating user
  def user_params
  	params[:user].permit(:email, :first_name, :last_name, :phone_number, :activity, :company_name, :company_ID_number, :company_description, :invoice_entity, :invoice_street, :invoice_street2, :invoice_postcode, :invoice_city, :invoice_country, :delivery_entity, :delivery_street, :delivery_street2, :delivery_postcode, :delivery_city, :delivery_country, :delivery_instructions)
  end

  #sort of all items by status to display on profile page
  def user_sales
    @item_status = {
      'draft' => 'Brouillons',
      'published' => 'En ligne',
      'sold' => 'Objets vendus'
    }

    @user_sales = {}
    @item_status.each do |status,translation|
      @user_sales[status] = @user.items.where(status:status)
    end

  end

  #sort of all orders by status to display on profile page
  def user_orders
    @order_status = {
      'payed' => 'Objets payés',
      'being_shipped' => 'En cours de livraison',
      'shipped' => 'Objets reçus'
    }

    @user_orders = {}
    @order_status.each do |status,translation|
      @user_orders[status] = @user.orders.where(status:status)
    end
  end

  def user_section
    begin 
      @section = params[:user].permit(:user_section)
    rescue
      @section = 'dashboard'
    end
    puts @section
  end

end
