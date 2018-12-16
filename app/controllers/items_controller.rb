class ItemsController < ApplicationController

  before_action :def_filters, only: [:index]
  before_action :set_item, except: [:new, :create, :index]

  def new
    if user_signed_in?
      @item = Item.new
    else
      flash[:error] = "Vous devez être connecté pour publier un article"
      redirect_to new_user_session_path
    end
  end

  def create
    #creation of the new item
    new_item = Item.create!(item_params)

    #Update the status of the user to tell he is a seller
    new_item.seller.update(is_seller:true)

    redirect_to item_path(new_item.id), notice: "Merci d'avoir créé cet article"
  end

  def index
    # Filter items according to the form parameters
    @item_selection = Item.where(@filters).order('created_at DESC').paginate(page: params[:page], per_page: 18)
  end

  def show
  end

  def edit
    unless @item.seller == current_user
      flash[:error] = "Vous n'avez pas les droits pour éditer cet objet"
      redirect_to item_path(params[:id])
    end

  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item.id), notice: "Article modifié"
  end

  def destroy
    @item.destroy
    redirect_to new_item_path
  end

  def duplicate
    new_item = Item.new
    new_item = @item
    new_item.save

    flash[:notice] = "Votre annonce a bien été dupliquée. Prenez le temps de la relire avant de la publier"
    redirect_to edit_item_path(new_item.id)
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
      params.require(:item).permit(:title, :category_id, :description, :price, :seller_id, :status, item_images: [])
  end

  def status
    @status = ['draft', 'published', 'sold', 'deleted']
  end

  def def_filters
    begin
      @filters = params.require(:item_filter).permit(:category_id, :status, :seller_id)
      puts @filters
    rescue
      @filters = {status:'published'}
    end
  end

end