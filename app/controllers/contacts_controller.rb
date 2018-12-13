class ContactsController < ApplicationController

  def new 
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message envoyé'
    else
      flash.now[:error] = 'Problème envoi du message'
      render :new
    end
  end

end
