class SessionsController < ApplicationController

  def create 
   @user = User.from_omniauth(env["omniauth.auth"])
   session[:user_id] = @user.id
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
   redirect_to '/', :notice => "You're Signed in"
  end

  def guest_login
   if @user = User.find_by(name: 'guest')
   else
     @user = User.create(name: 'guest', email: 'tienrsdikse@gmail.com', 
                 user_img_url: "https://www.mensa.ch/sites/default/files/u184/guest_card_icon.jpg")
   end
   session[:user_id] = @user.id
   @current_user = User.find_by(name: 'guest')   
   redirect_to '/', :notice => "You're Signed in"
  end





  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You're Signed out."
  end

end
