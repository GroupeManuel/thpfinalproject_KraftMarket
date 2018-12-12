class ItemsController < ApplicationController

  before_action :def_filters, only: [:index]

  def new
    @item = Item.new
  end

  def create
    #creation of the new item
    new_item = Item.create!(item_params)

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