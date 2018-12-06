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

      # Select items with category in the form 

    if params[:search_form] == nil
      @items_selection = Item.all.published
      @items_selection = @items_selection.order('created_at DESC')
      @items_selection = @items_selection.published
    else
      @items_selection = Item.where(category_id: params[:search_form][:category_id])
      @items_selection = @items_selection.order('created_at DESC')
      @items_selection = @items_selection.published
    end

  end

  def show
    @item = Item.find(params[:id])

      # Create a session variable for use the item in page cart#show
    session[:item_id] = @item.id
  end

  def edit
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
