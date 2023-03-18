class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.all
  end
end
