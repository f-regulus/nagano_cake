class SearchesController < ApplicationController
  
  def search
    # @wordへ入力された値を代入する
    @word = params[:word]
    
    # 検索文字が0文字~15文字以内の場合検索し、それ以外は元のページへ遷移する
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
