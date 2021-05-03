class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_item = CartItem.new
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
