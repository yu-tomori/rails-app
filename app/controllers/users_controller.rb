class UsersController < ApplicationController
 before_action :get_user

 def show
 end

 def edit
  
 end

 def update
  if @user.update_attributes(user_params)
   flash[:success] = "ユーザ情報を変更しました."
   redirect_to @user
  else
   render 'edit'
  end 
 end

 private
  
  def get_user
   @user = User.find(session[:user_id])
  end
 
  def user_params
   params.require(:user).permit(:name, :description, :picture, :type)
  end

end
