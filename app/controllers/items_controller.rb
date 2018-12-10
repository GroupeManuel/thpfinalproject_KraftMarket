class ItemsController < ApplicationController

  before_action :def_filters, only: [:index]

  def new
    @item = Item.new
  end

  def create
    #creation of the new item
    Item.create!(item_params)
    #TO BE CHANGED WHEN WE HAVE A INDEX VIEW OR A SHOW VIEW READY 
    redirect_to root_path, notice: "Merci d'avoir créé cet article"
  end

  def index
    # Filter items according to the form parameters
    @item_selection = Item.where(@filters).order('created_at DESC')

  end

  def show
    @item = Item.find(params[:id])
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

  def def_filters
    begin
      @filters = params.require(:item_filter).permit(:category_id, :status, :seller_id)
      puts @filters
    rescue
      @filters = {status:'published'}
    end
  end

end