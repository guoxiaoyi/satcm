class CategoriesController < ApplicationController
  def show
    category_id = params[:id]
    @category = ArticleCategory.find(category_id)
    if @category.root.name == '科室建设'
      @category = @category.self_and_ancestors.find{|category| category.level == 1}
    end

  end
end
