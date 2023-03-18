class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.all
  end
  
  def edit
    @customer = current.customer
  end
end
