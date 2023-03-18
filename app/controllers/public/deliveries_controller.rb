class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save!
      flash[:notice] = "Book was successfully created."
      redirect_to deliveries_path
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def update
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to deliveries_path
  end
  
  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end
  
end
