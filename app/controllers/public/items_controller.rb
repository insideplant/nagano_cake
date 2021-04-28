class Public::ItemsController < ApplicationController
  def index
    @items = Item.new
  end

  def show
  end
  
end
