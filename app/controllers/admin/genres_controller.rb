class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(order_params)
    @genre.save
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
