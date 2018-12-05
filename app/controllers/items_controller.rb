class ItemsController < ApplicationController

  def new
  end

  def create
    @new_item = Item.create!(item_params)
    redirect_to items_upload_images_path
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

  def optimization

  end

  def thanks
  end

end
