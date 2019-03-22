class LikesController < ApplicationController
  before_action :get_login_user
 
  def create
   @article = Article.find(params[:article_id])
   unless @article.like?(@login_user)
    @article.like(@login_user)
    @article.reload
    respond_to do |format|
     format.html {redirect_to user_path(@article.user)}
     format.js
    end
   end
  end

  def destroy
   @article = Like.find(params[:id]).article
   if @article.like?(@login_user)
    @article.unlike(@login_user)
    @article.reload
    respond_to do |format|
     format.html {redirect_to user_path(@article.user)}
     format.js
    end
   end
  end

   private
  
   def get_login_user
    @login_user = User.find(session[:user_id])
   end

end
