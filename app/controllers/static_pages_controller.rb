class StaticPagesController < ApplicationController
 before_action :get_login_user 
 
  def home
   @tags = Tag.all
   @info =  session["devise.twitter_data"]

   if session[:user_id] 
    @user = User.find(session[:user_id])
   end

   @home_users = User.all # 後で修正
   # @home_users.each{ |user| user.picture.recreate_versions! }


   if params[:type].present? && params[:featured].present?
    if params[:type] == 'カテゴリ'
     if params[:featured] == '表示順' or params[:featured] == 'Likeが多い'
      get_article_by_sql
     else # params[:featured] == '最近'
      @home_articles = Article.all.order(created_at: 'DESC').limit(20)
     end
    else
     if params[:featured] == '表示順' or params[:featured] == 'Likeが多い'
      get_article_by_sql_with_type(params[:type])
     else # params[:featured] == '最近'
      @home_articles = Article.where(type: params[:type]).order(created_at: 'DESC').limit(20)
     end
    end
   elsif params[:tag_id].present?
    @home_articles = Tag.find(params[:tag_id]).articles.limit(40)
   else
    @home_articles = Article.order("id DESC").limit(40)
   end

   @home_articles.each{ |article| article.image.recreate_versions! }
  end

  def privacy
  end
 
  def terms
  end

  def contact
  end



 private

  def get_login_user
   if !!session[:user_id]
    @login_user = User.find(session[:user_id])
   end
  end

  def get_article_by_sql_with_type(type)
  
   sql = ActiveRecord::Base.send(
      :sanitize_sql_array,[
       'SELECT articles.id FROM articles INNER JOIN (select count(*) from likes, articles where likes.article_id = articles.id ) as likes_count WHERE articles.type = :type', type: type

      ]
     )
     home_article_ids = ActiveRecord::Base.connection.select_all(sql)
     @home_articles = Article.find(home_article_ids.to_a.map {|id| id.values}.flatten)
  end

  def get_article_by_sql
   sql = ActiveRecord::Base.send(
    :sanitize_sql_array,[
    'SELECT articles.id FROM articles INNER JOIN (select count(*) from likes, articles where likes.article_id = articles.id) as likes_count;'
    ]
   )
   # @home_articles = ActiveRecord::Base.connection.select_one(sql)
   home_article_ids = ActiveRecord::Base.connection.select_all(sql)
   @home_articles = Article.find(home_article_ids.to_a.map {|id| id.values}.flatten)
  end

end
