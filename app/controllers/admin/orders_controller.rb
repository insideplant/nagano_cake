class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @sum = 0
    @order_details.each do |order_detail|

     sub_total = order_detail.total_price.to_i
     @sum+=sub_total
    end
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
