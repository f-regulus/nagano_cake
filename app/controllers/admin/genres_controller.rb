class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :edit_genre, only: [:edit, :update, :destroy]
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'ジャンルを登録しました'
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end
  
  def update
    if @genre.update(genre_params)
      flash[:notice] = '変更を保存しました'
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  def destroy
    if @genre.destroy
      flash[:notice] = '該当のジャンルを削除しました'
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  private
  def edit_genre
    @genre = Genre.find_by(id: params[:id])
  end
  
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
  
end
