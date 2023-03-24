class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!

  def update
    @order = OrderDetail.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details
      
    redirect_to admin_order_path(@order_detail.order.id)
    
  end
    
  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
