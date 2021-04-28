class Admin::ProductsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:post_image).permit(:genre, :name, :image, :introduction, :price)
  end
  
end
