class Admin::ProductsController < ApplicationController
  def index
    @items = Item.all
    item.genre_id = genre.id
  end

  def new
    @new_item = Item.new
    @genres = Genre.all
  end

  def create
    @new_item = Item.new(item_params)
    @new_item.save
    redirect_to admin_products_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_products_path(item.id)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre, :name, :image, :price, :introduction)
  end
  
end
