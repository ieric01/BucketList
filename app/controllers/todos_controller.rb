class TodosController < ApplicationController


  def search
    fz = FuzzyMatch.new(Todo.all, :read => :name)
    @results = fz.find_all(params['/']['name'])
    
    render 'results'
  end
end
