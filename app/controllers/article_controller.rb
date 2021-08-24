class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
    if @article.article_category.root.name == '科室建设'
      @category = @article.article_category.self_and_ancestors.find{|category| category.level == 1}
    else
      @category = @article.article_category.root
    end
  end
end
