class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @category = @article.article_category.root
  end
end
