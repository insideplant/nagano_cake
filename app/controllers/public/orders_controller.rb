class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @order = Order.new
  end

  def confirm
     @order = Order.new(order_params)
     @cart_items = CartItem.all
    if params[:order][:payment_method] == "credit"
     @payment_method_a = "クレジット"
     @payment_method_b = "credit"

    else
     @payment_method_a = "銀行振り込み"
     @payment_method_b = "bank_transfar"
    end

    if params[:order][:address_option] == "0"
      @order.customer_name = current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.customer_name = @address.customer_name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    elsif params[:order][:address_option] == "2"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.customer_name = params[:order][:customer_name]
    end
  end

  def complete
  end

  def create
   order = Order.new(order_params)
   if order.save
      cart_items = CartItem.where(params[:order][:customer_id])
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new(customer_id: current_customer.id, order_id: order.id,item_id: cart_item.item.id,price: cart_item.item.price, amount: cart_item.amount)
        order_detail.save
      end
      @delete_item = CartItem.where(params[:order][:customer_id])
      @delete_item.destroy_all
      redirect_to complete_orders_path
   else
      render :confirm
   end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:customer_name,:customer_id,:shipping_fee,:payment_amount,:payment_method,:status)
  end

end
