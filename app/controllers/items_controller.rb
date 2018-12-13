class ItemsController < ApplicationController

  before_action :def_filters, only: [:index]

  def new
    if current_user
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
    @item_selection = Item.where(@filters).order('created_at DESC')

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id), notice: "Article modifié"
  end

  def destroy
    @destroy_item = Item.find(params[:item_id])
    @destroy_item.destroy
    redirect_to new_item_path
  end
  
  private

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