class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @order = Order.all
  end

  def confirm
     @order = Order.new(order_params)
     @cart_items = CartItem.all
    if params[:order][:payment_method] == "credit"
     return @payment_method = "クレジット"
    else
     return @payment_method = "銀行振り込み"
    end
    
    if params[:order][:address_option] == "0"
      @order.name
      @order.postal_code
      @order.address
    elsif params[:order][:address_option] == "1"
      @address = Address.params[:address_id]
    elsif params[:order][:address_option] == "2"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.customer_name = params[:order][:customer_name]
    end
    
    render :orders_confirm
  end

  def complete
  end

  def create
   @order = Order.new(order_params)
　 if @order.save
　　  redirect_to orders_complete_path
　　else
　　  render :orders_confirm_path
　　end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:customer_name,:shipping_fee,:payment_amount,:payment_method,:status)
  end

end
