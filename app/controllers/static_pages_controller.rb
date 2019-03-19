class StaticPagesController < ApplicationController
 
  def home
   @info =  session["devise.twitter_data"]
   if session[:user_id]
    @user = User.find(session[:user_id])
   end
  end



 private


end
