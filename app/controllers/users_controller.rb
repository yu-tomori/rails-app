class UsersController < ApplicationController
 before_action :get_user

 def show
 end

 def edit
  
 end

 private
  
  def get_user
   @user = User.find(session[:user_id])
  end

end
