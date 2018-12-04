class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    #When necessary, creation of new category from ItemsHelper
    create_category
    
    #creation of the new item
    Item.create!(essential_item_params)

    redirect_to item_optimize_path
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

  def optimize
    @item = Item.last
  end

  def thanks
  end

  
  private

  def essential_item_params
      @item_params.permit(:title, :category_id, :description, :seller_id, :status)
  end

  def status
    @status = ['draft', 'published', 'sold', 'deleted']
  end

  def create_category
    @item_params = params[:item]

    unless @item_params[:other_category] == nil
      Category.create(category_name: @item_params[:other_category])
      @item_params[:category_id] = Category.last.id
      return @item_params
    end
  end

end
