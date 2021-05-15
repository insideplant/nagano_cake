class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(amount: params[:cart_item][:amount])
    @cart_items = CartItem.where(customer_id: current_customer)
    render :index
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
    cart_item = CartItem.find_by(customer_id: current_customer.id,item_id: params[:cart_item][:item_id])
    if cart_item
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
    else
     cart_item = CartItem.new(cart_item_params)
     cart_item.save
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
