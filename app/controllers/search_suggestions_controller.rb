class SearchSuggestionsController < ApplicationController
  def index


    results = SearchSuggestion.suggestions_scroll(search_params[:term])
    
#    results = [
    #{label: 'go go go', value: 'tsrtrsatar'},
    #{label: 'tototot', value: '43242'}
    #]

results2 = results.map do |todo| 
     current_todo = Todo.find_by_name(todo)
      {label: "#{current_todo.name}", value:"/todos/#{current_todo.id}"}
   end 



    render :json => results2



   
  end



  private

  def search_params
    params.permit(:term)
  end
end
