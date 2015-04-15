class SearchSuggestionsController < ApplicationController
	def index
		render json: %w[eric ming doughes]
	end
end
