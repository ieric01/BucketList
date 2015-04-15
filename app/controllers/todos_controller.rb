class TodosController < ApplicationController


  def search
    
    fz = FuzzyMatch.new(Todo.all, :read => :name)
    @results = fz.find_all(params['/']['name'])
    flash[:message] = @results
    render 'results'
  end

  def add_todo_to_user
   @results = flash[:message]
   flash[:message] = @results 

   arr = [] 
   @results.each do |result|
     arr << Todo.find_by(:name => result['name'])
   end
   @results = arr
    
    UserTodo.create(:user_id => current_user.id,
                    :todo_id =>  Todo.find_by(:name => params['todo']).id)
    
  
    render 'results'
  end
end
