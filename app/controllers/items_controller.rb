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

      # Select items with category in the form 

    if params[:search_form] == nil
      @items_selection = Item.all.published
    else
      @items_selection = Item.where(category_id: params[:search_form][:category_id]).published
    end

  end

  def show
    @item = Item.find(params[:id])

      # Create a session variable for use the item in page cart#show
    session[:item_id] = @item.id
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

  def other_item_params
      @item_params.permit(:images)
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
