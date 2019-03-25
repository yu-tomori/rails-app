class TagsController < ApplicationController
  before_action :get_tag
  before_action :get_login_user

  def create
   @article = Article.find(params[:article_id])
   unless @article.tag?(@tag)
    @article.tag(@tag)
    @article.reload
    respond_to do |format|
     format.html { redirect_to :back }
     format.js
    end
   end
  end

  def destroy
   @article = Tag.find(params[:id]).article
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
