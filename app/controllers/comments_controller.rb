class CommentsController < ApplicationController
 before_action :comment_params, only: :create 

 def create
  @comment = Comment.new(comment_params)
  if @comment.save!
   @comments = Comment.where(article_id: params[:article_id])
   respond_to do |format|
    format.html {redirect_to article_path(params[:comment][:article_id])}
    format.js { flash[:success] = "コメントありがとうございます" }
   end
  else
   respond_to do |format|
    format.html {redirect_to article_path(params[:comment][:article_id])}
    format.js { flash[:danger] = "コメントできませんでした" }
   end
  end
 end

 def destroy
   
 end

  private
 
  def comment_params
   params.require(:comment).permit(:user_id, :article_id, :content)
  end
end
