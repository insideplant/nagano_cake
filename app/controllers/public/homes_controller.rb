class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all.page(params[:page]).reverse_order
  end
  
  def about
  end
  
end
