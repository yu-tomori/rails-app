class StaticPagesController < ApplicationController
 before_action :get_login_user 
 
  def home
   @tags = Tag.all
   @info =  session["devise.twitter_data"]

   if session[:user_id]
    @user = User.find(session[:user_id])
   end

   @home_users = User.all # 後で修正
   @home_users.each{ |user| user.picture.recreate_versions! }


   if params[:type].present?
     @home_articles = Article.where(type: params[:type]).limit(8).order("id DESC")
   elsif params[:tag_id].present?
    @home_articles = Tag.find(params[:tag_id]).articles.limit(8)
   else
    @home_articles = Article.order("id DESC").limit(8)
   end

   @home_articles.each{ |article| article.image.recreate_versions! }
  end




 private

  def get_login_user
   if !!session[:user_id]
    @login_user = User.find(session[:user_id])
   end
  end

end
