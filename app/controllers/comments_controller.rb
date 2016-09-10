class CommentsController < ApplicationController
  def create
    if params[:comment][:article_id] == nil
      flash[:notice] = "Fuck, that article is gone, man"
      redirect_to root_path
    else
      @article = Article.find(params[:article_id])
      @comment = @article.comments.new(comment_params)
      if @comment.save
        redirect_to article_path(@article)
      else
        @article.reload
        flash[:notice] = "You probably entered a crap email"
        render 'articles/show'
      end
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :email)
    end
end
