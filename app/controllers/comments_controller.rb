class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      email_problems
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :email)
    end

    def email_problems
      @article.reload
      flash[:notice] = "You probably entered a crap email"
      render 'articles/show'
    end
end
