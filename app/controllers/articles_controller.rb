class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
    @comment = @article.comments.new
  end
end
