class ArticlesController < ApplicationController
 before_action :get_login_user
 before_action :login_check, except: :show
 after_action :default_image, only: :create

 def show
  @article = Article.find(params[:id])
  @creator = User.find(@article.user.id)
 end

 def new
  @article = Article.new
 end

 def create
  @article = Article.new(article_params)
  if @article.save
   flash[:success] = "作品を投稿しました."
   redirect_to @article 
  else
   render 'new'
  end
 end

 def edit
  @article = @login_user.articles.find(params[:id])
 end

 def update
  @article = Article.find(params[:id])
  if @article.update_attributes(article_params)
   flash[:success] = "作品の情報を変更しました"
   redirect_to @article
  else
   render 'edit'
  end  
 end

 def destroy
  Article.find(params[:id]).destroy
  flash[:success] = "作品のデータを消去しました"
  redirect_to @login_user
 end

  private
 
   def get_login_user
    @login_user = User.find(session[:user_id]) if session[:user_id].present?
   end

   def login_check
    if !@login_user.present?
      redirect_to root_path
    end
   end
 
   def article_params
    params.require(:article).permit(:user_id, :name, :url, :description, :catchcopy, :image)
   end

   def default_image
    article = Article.last
    article.update_attribute( "image" ,  open("#{Rails.root}/app/assets/images/mono-gradation.png")) if article.image.file.nil?
   end
end
