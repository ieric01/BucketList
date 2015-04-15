class SearchSuggestionsController < ApplicationController
  def index
    # render json: 
    results = SearchSuggestion.terms_for(search_params[:term])
    # binding.pry
    render json: results
	end

  private

  def search_params
    params.permit(:term)
  end
end
