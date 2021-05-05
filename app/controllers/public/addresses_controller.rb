class Public::AddressesController < ApplicationController
  def index
    @new_address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end
  
  private

  def address_params
    params.require(:address).permit(:customer_name, :postal_code, :address)
  end

end
