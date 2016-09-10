class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    try_saving_comment
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :email)
    end

    def try_saving_comment
      if @comment.save
        redirect_to article_path(@article)
      else
        email_problems
      end
    end

    def email_problems
      @article.reload
      flash[:notice] = "You probably entered a crap email"
      render 'articles/show'
    end
end
