class SearchSuggestionsController < ApplicationController
	def index
		# binding.pry
		render json: SearchSuggestion.terms_for(params[:term])
	end
end
