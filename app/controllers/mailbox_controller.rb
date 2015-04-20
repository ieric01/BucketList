class MailboxController < ApplicationController

  def inbox
  end

  def new_message
    @users = User.all - [current_user]
    
  end

  def send_message
current_user.send_message(User.find(params["/new_message"]["user_id"].to_i), 
                          params["/new_message"]["body"], 
                          params["/new_message"]["subject"])
flash[:success] = "Message has been sent!"
redirect_to :back
  end

end

