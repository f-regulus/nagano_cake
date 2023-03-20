class SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    @result = Item.search_for(@word)
  end
end
