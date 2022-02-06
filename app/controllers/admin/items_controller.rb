class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item.new(item_params)
    if @item.save
      flash[:notice] = "create"
      redirect_to admin_item_path(@item.id)
    else
      flash.now[:notice] = "not create"
      render 'new'
      redirect_to admin_items_path
  end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
  
end
