class WelcomeController < ApplicationController

  def home
    @todo = Todo.new 

  end

end
