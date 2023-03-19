class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(order_params)
    @customer = current_customer
    @deliveries = Delivery.all
  end

  def index
  end

  def show
  end
  
  def confirm
  end
  
  def success
  end
  
  def order_params
    #params.require(:order).permit(:payment)
  end
end
