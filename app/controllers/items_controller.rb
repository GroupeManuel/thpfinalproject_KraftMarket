class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    #When necessary, creation of new category from ItemsHelper
    if create_category
      item_params[:category_id] = Category.last.id
    end

    #creation of the new item
    Item.create!(item_params)

    redirect_to item_optimize_path(Item.last.id)
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

  def optimize(id)
    @item = Item.find(id)
  end

  def thanks
  end

  
  private

  def item_params
    if params
    params.require(:item).permit(:title, :category_id, :description, :seller_id, :status)
    end
  end

  def status
    @status = ['draft', 'published', 'sold', 'deleted']
  end

  def create_category
    unless params[:item][:other_category] == nil
      Category.create(category_name: params[:item][:other_category])
        return true
      end
      return false
  end

end
