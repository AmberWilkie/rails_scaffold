class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      flash[:notice] = "You probably entered a crap email"
      @body = params[:comment][:body]
      render 'articles/article'
      # redirect_to article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :email)
    end
end
