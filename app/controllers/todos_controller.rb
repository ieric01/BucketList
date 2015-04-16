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
    # binding.pry
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

  def complete_todo
    @completed_todo = current_user.user_todos.where(:todo_id => params["id"])
    @completed_todo.find_by_todo_id(params['id']).update(:finished => true)
    redirect_to '/completed_list'
  end

  def complete_show
    @completed_todo_array = current_user.user_todos.select {|todo| todo if todo.finished}
    render 'completed_list'
  end

  def my_list
    flash[:last_page] = 'my list'
    @my_todos = current_user.todos
  end

  def users_with_this_todo
    @todo_id = Todo.find_by(:name => params['todo']).id
    @comments = Comment.where(:todo_id => @todo_id )
    @users_with_todo = Todo.find_by(:name => params['todo']).users
    @comment = Comment.new
    render 'users_with_this_todo'

  end


  private

  def search_params
    params.permit(:name)
  end
end
