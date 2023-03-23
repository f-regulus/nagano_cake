class SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    
    if @word.length == 0 || @word.length >= 15
      redirect_back fallback_location: root_path
    else
      @result = Item.search_for(@word)
    end
  end
  
  def genre_search
    @word = params[:genre_word]
    @genre = params[:genre_id]
    @result = Item.where(id: @genre)
  end
  
end
