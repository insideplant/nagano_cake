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
   @order = Order.new(order_params)
   if @order.save
     
      redirect_to complete_orders_path
   else
      render :confirm
   end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    arams.require(:order).permit(:postal_code,:address,:customer_name,:customer_id,:shipping_fee,:payment_amount,:payment_method,:status)
  end

end
