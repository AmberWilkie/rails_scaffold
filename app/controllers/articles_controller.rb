class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
    # binding.pry
    render :article
  end
end
