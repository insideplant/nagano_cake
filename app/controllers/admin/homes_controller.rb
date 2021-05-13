class Admin::HomesController < ApplicationController
  def top
    if params[:id]
     @orders = Order.where(customer_id: params[:id])
    else
     @orders = Order.all
    end
  end

end
