class StaticPagesController < ApplicationController
 before_action :get_login_user 
 
  def home
   @info =  session["devise.twitter_data"]
   if session[:user_id]
    @user = User.find(session[:user_id])
   end

   @home_users = User.all # 後で修正
   @home_users.each{ |user| user.picture.recreate_versions! }

   @home_articles = Article.find([1, 2, 3, 4, 5, 6, 7, 63])
   @home_articles.each{ |article| article.image.recreate_versions! }
  end



 private

  def get_login_user
   if !!session[:user_id]
    @login_user = User.find(session[:user_id])
   end
  end

end
