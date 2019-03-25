class TagmapsController < ApplicationController
 before_action :get_tag
 before_action :get_login_user  

  def create
   @article = Article.find(params[:article_id])
   if @article.tag?(@tag)
    respond_to do |format|
     format.html { redirect_to tag_article_path(@artivle) }
     format.js { flash[:warning] = "#{@tag.content}は既にタグとして登録されています" }
    end
   else
    @article.tag(@tag)
    @article.reload
    respond_to do |format|
     format.html { redirect_to tag_article_path(@article) }
     format.js
    end
   end
  end

  def destroy
   @article = Article.find(params[:article_id])
   if @article.tag?(@tag)
    @article.untag(@tag)
    @article.reload
    respond_to do |format|
     format.html { redirect_to :back }
     format.js
    end
   end
  end

   private

   def get_tag
    @tag = Tag.find(params[:tag_id])
   end

   def get_login_user
    @login_user = User.find(session[:user_id])
   end
end
