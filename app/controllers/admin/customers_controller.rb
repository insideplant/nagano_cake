class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    custmoer = Customer.find(params[:id])
    custmoer.update(customer_params)
    redirect_to admin_customer_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:user_name,:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:adress,:telephone_number,:is_active,:email)
  end
  
end
