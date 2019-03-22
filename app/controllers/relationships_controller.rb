class RelationshipsController < ApplicationController
 before_action :is_login?

 def create
  @user = User.find(params[:followed_id])
  @login_user.follow(@user)
  respond_to do |format|
   format.html {redirect_to @user}
   format.js
  end
 end

 def destroy
  @user = Relationship.find(params[:id]).followed
  @login_user.unfollow(@user)
  respond_to do |format|
   format.html {redirect_to @user}
   format.js
  end
 end

  private

  def is_login?
   if !session[:user_id]
    redirect_to root_path
   else 
    @login_user = User.find(session[:user_id])
   end
  end
end
