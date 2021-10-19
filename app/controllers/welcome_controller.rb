class WelcomeController < ApplicationController
  def index
    @news = ArticleCategory.find_by(custom_key: '新闻')
    @articles = Article.where(article_category_id: @news.descendants.pluck(:id)).limit(3).order(created_at: :desc)
    @office_build = ArticleCategory.find_by(custom_key: '科室建设')

    # p Dir.entries(Rails.public_path)
  end
end
