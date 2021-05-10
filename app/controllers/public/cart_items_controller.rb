class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.find_by(customer_id: current_customer.id)
    if params[:cart_item][:item_id] == cart_item.item_id
     cart_item.amount += params[:cart_item][:amount]
     cart_item.update
    else
     cart_item = CartItem.new(cart_item_params)
     cart_item.save
    end
    redirect_to items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
