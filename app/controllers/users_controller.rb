class UsersController < ApplicationController

  def signup
    
  end

  def see_user_list
  	#need to find by id not name
    user = User.find(params['name'])
    @user_todos = user.todos
  end

  def index
    @all_users = User.all
  end
end
