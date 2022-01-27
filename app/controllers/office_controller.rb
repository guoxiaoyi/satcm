class OfficeController < ApplicationController
  def show
    @category = ArticleCategory.find_by(id:  params[:id])
  end
end
