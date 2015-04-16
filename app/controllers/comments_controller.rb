class CommentsController < ApplicationController

  def create
  Comment.create(:content => params['comment']['content'],
                 :todo_id => params['comment']['todo_id'],
                 :user_id => current_user.id)
   redirect_to (:back)
  end


end
