class WelcomeController < ApplicationController

  def home
    @todo = Todo.new 
#    binding.pry
    #@todo = Todo.new 


  end

end
