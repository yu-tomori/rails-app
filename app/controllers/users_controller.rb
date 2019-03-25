class UsersController < ApplicationController
 before_action :get_login_user, only: [:show, :edit, :update]
 before_action :get_user, only: [:show]

 def show
  @users_articles = @user.articles
  @users_articles.each{ |article| article.image.recreate_versions! }
 end

 def edit
  
 end

 def update
  if @login_user.update_attributes(user_params)
   flash[:success] = "ユーザ情報を変更しました."
   redirect_to @login_user
  else
   render 'edit'
  end 
 end

 def destroy
  session[:user_id] = nil
  redirect_to root_path
 end

 private
  
  def get_login_user
   if session[:user_id].present?
    @login_user = User.find(session[:user_id])
   end
  end

  def get_user
   @user = User.find(params[:id])
  end
 
  def user_params
   params.require(:user).permit(:name, :description, :picture, :type)
  end

end
