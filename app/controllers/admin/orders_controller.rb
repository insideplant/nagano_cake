class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:order][:status])
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    render :show
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
