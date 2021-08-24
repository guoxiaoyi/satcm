class CategoriesController < ApplicationController
  def show
    category_id = params[:id]
    @category = ArticleCategory.find(category_id)
  end
end
