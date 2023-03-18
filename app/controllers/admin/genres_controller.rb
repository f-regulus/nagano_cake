class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  
  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to admin_genres_path
  end

  def edit
  end
  
  def update
  end
  
  private
  def order_params
    params.require(:genre).permit(:genre_name)
  end
end
