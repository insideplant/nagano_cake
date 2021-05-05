class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
  end

  def confirm
     @order = Order.new(order_params)

    if find(params[:address_option])

    end
  end

  def complete
  end

  def create
   @order = Order.new(order_params)
　 if @order.save
　　  redirect_to root_path, notice: 'ご注文を送信しました'
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
