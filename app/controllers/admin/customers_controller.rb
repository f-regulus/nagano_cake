class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end

private

def customer_params
  params.require(:customer).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:email,:encrypted_password,:postal_code,:address,:telephone_number,:is_deleted)
end
