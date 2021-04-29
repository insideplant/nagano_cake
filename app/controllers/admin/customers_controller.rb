class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
    @customers = Customer.new
  end

  def update
  end
end
