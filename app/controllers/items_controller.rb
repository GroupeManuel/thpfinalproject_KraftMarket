class ItemsController < ApplicationController

  def new
  end

  def create
    @new_item = Item.create!(item_params)
    redirect_to items_upload_images_path
  end

  def index
    @items = Item.all.where(category_id: params[:category_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @destroy_item = Item.find(params[:item_id])
    @destroy_item.destroy
    redirect_to new_item_path
  end

  def optimization
    @new_item = Item.last
  end

  def thanks
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :title, :description)
  end
end
