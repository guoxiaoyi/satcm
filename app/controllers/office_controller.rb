class OfficeController < ApplicationController
  def show
    @category = ArticleCategory.find_by(name:  params[:id])
  end
end
