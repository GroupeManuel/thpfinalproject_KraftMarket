class ContactsController < ApplicationController

  def new 
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
  redirect_to root_path, notice: "Votre message a bien été envoyé"
    else
      flash.now[:error] = "Votre message n'a pu être envoyé"
      render :new
    end
  end

end
