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
    
    if params[:order][:address] == "credit"
      return @address = Customer.find(current_customer.id)
    elsif params[:order][:address] == "credit"
      return @address = Address.params[:id]
    else params[:order][:address] == "credit"
      return params[:order][:address]
      
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
