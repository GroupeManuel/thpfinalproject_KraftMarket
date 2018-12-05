class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    #creation of the new item
    Item.create!(item_params)
    #TO BE CHANGED WHEN WE HAVE A INDEX VIEW OR A SHOW VIEW READY 
    redirect_to root_path
  end

  def index
    @items = Item.all.where(category_id: params[:category_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def thanks
    @item = Item.last
  end

  def destroy
    @destroy_item = Item.find(params[:item_id])
    @destroy_item.destroy
    redirect_to new_item_path
  end
  
  private

  def item_params
      params.require(:item).permit(:title, :category_id, :description, :seller_id, :status, item_images: [])
  end

  def status
    @status = ['draft', 'published', 'sold', 'deleted']
  end

end
