class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
  end




private

def order_params
  params.require(:order).permit(:status)
end

end
