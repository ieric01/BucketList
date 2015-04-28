class UsersController < ApplicationController

  def signup
    
  end

  def see_user_list
    user = User.find_by(:name => params['name'])
    @user_todos = user.todos
  end

  def all_users
    @all_users = User.all
    render 'all_users'
  end
end
