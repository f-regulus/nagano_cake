class SearchesController < ApplicationController
  before_action :genre_all
  
  def search
    @word = params[:word]
    
    if @word.length == 0 || @word.length >= 20
      redirect_back fallback_location: root_path
    else
      @result = Item.search_for(@word)
    end
  end
  
  def genre_search
    @word = params[:genre_word]
    @items = params[:items]
    @result = Item.where(id: @items)
  end
  
  def genre_all
    @genres = Genre.all
  end
  
end
