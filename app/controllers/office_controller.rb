class OfficeController < ApplicationController
  def show
    @category = ArticleCategory.find_by(custom_key:  params[:id])
  end
end
