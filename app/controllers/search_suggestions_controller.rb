class SearchSuggestionsController < ApplicationController
  def index
    results = SearchSuggestion.suggestions_scroll(search_params[:term])
    render :json => results
  end

  private

  def search_params
    params.permit(:term)
  end
end
