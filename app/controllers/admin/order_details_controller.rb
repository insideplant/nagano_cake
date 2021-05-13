class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(is_active: params[:order_detail][:status])
    @order = Order.find(params[:order_id])
    @order_details = OrderDetail.where(order_id: @order.id)
    render :show
  end
end
