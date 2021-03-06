class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).reverse_order
    @cart_item = CartItem.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
