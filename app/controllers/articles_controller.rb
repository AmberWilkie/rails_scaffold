class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
    @comment = Comment.create(article_id: @article.id)
    render :article
  end
end
