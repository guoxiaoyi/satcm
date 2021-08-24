class WelcomeController < ApplicationController
  def index
    @news = ArticleCategory.find_by(custom_key: '新闻')
    @articles = Article.where(article_category_id: @news.descendants.pluck(:id)).order(created_at: :desc)
  end
end
