class SearchSuggestionsController < ApplicationController
  def index
    # render json: 
    # binding.pry
    results = SearchSuggestion.suggestions_scroll(search_params[:term])
    render :json => results
  end

  private

  def search_params
    params.permit(:term)
  end
end
