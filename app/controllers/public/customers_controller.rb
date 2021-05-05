class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def active_confirm
  end

  def not_active
  end

  private
  def customer_params
   params.require(:customer).permit(:user_name,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_active,:email,:encrypted_password,:password_confirmation)
  end

end
