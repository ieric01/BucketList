class SearchSuggestionsController < ApplicationController
  def index
    results = SearchSuggestion.suggestions_scroll(search_params[:term].downcase)
    
    results.map! do |todo| 
    current_todo = Todo.find_by_name(todo)
      {label: "#{current_todo.name}", url_value:"/todos/#{current_todo.id}"}
    end 

    render :json => results

  end

  private

  def search_params
    params.permit(:term)
  end
end
