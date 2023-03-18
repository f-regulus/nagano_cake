class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.all
  end
  
  def edit
    @customer = current.ustomer
  end
end
