class Admin::ProductsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @new_item = Item.new
    @genres = Genre.all
  end

  def create
    @new_item = Item.new(item_params)
    if @new_item.save
      redirect_to admin_products_path
    else
      render :new
    end
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
    params.require(:item).permit(:genre_id, :name, :image, :price, :introduction, :is_active)
  end

end
