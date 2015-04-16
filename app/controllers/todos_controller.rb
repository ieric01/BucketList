class TodosController < ApplicationController

  before_action :authorized_user

    def authorized_user
      if current_user.nil?
        redirect_to "/auth/facebook", notice: "log in first" 
      end
    end


  def search    
    fz = FuzzyMatch.new(Todo.all, :read => search_params[:name])
    @results = fz.find_all(search_params)
    flash[:message] = @results
    render 'results'
  end

  def add_todo_to_user
   @results = flash[:message]
   flash[:message] = @results 

   arr = []
   return redirect_to '/' if @results.nil?
   @results.each do |result|
     arr << Todo.find_by(:name => result['name'])
   end
   @results = arr

   if current_user.todos.include? Todo.find_by(:name => params['todo'])
   else
    UserTodo.create(:user_id => current_user.id,
                    :todo_id =>  Todo.find_by(:name => params['todo']).id)
   end
    
  

    render 'results'
  end

  def delete_todo_from_user
    if !(current_user.todos.include? Todo.find_by(:name => params['todo']))
      return redirect_to '/' 
    end

   if flash[:message]

     @results = flash[:message]
     flash[:message] = @results 

     arr = [] 

     @results.each do |result|
       arr << Todo.find_by(:name => result['name'])
     end
     @results = arr
      
      UserTodo.find_by(:user_id => current_user.id,
                       :todo_id =>  Todo.find_by(:name => params['todo']).id).destroy

     render 'results'
   end

    if flash[:last_page] == 'my list'
    UserTodo.find_by(:user_id => current_user.id,
                     :todo_id =>  Todo.find_by(:name => params['todo']).id).destroy
      redirect_to '/mylist'  
    end
  end

  def my_list
    flash[:last_page] = 'my list'
    @my_todos = current_user.todos
  end

  def users_with_this_todo
    @users_with_todo = Todo.find_by(:name => params['todo']).users
    render 'users_with_this_todo'

  end


  private

  def search_params
    params.permit(:name)
  end
end
