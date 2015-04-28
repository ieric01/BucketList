class UsersController < ApplicationController

  def signup
    
  end

  def see_user_list
    user = User.find_by(:name => params['name'])
    @user_todos = user.todos
  end

  def index
    @all_users = User.all
  end
end
