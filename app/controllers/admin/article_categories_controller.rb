class Admin::ArticleCategoriesController < Admin::ApplicationController
  before_action :set_article_category, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/article_categories
  # GET /admin/article_categories.json
  def index
    @article_categories = ArticleCategory.where(parent_id: nil)
  end

  # GET /admin/article_categories/1
  # GET /admin/article_categories/1.json
  def show
    redirect_to admin_article_categories_path
  end

  # GET /admin/article_categories/new
  def new
    @article_category = ArticleCategory.new
  end

  # GET /admin/article_categories/1/edit
  def edit
  end

  def update_nav
    ArticleCategory.find(params[:article_category_id]).update(is_nav: params[:is_nav])
  end
  # POST /admin/article_categories
  # POST /admin/article_categories.json
  def create
    @article_category = ArticleCategory.new(article_category_params)

    respond_to do |format|
      if @article_category.save
        Log.create(title: "添加 #{@article_category.name} 分类", user: current_user)
        format.html { redirect_to [:admin, @article_category], notice: 'Article category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/article_categories/1
  # PATCH/PUT /admin/article_categories/1.json
  def update
    respond_to do |format|
      if @article_category.update(article_category_params)
        Log.create(title: "更新 #{@article_category.name} 分类", user: current_user)
        format.html { redirect_to [:admin, @article_category], notice: 'Article category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article_categories/1
  # DELETE /admin/article_categories/1.json
  def destroy
    @article_category.destroy
    Log.create(title: "删除 #{@article_category.name} 分类", user: current_user)
    respond_to do |format|
      format.html { redirect_to admin_article_categories_url, notice: 'Article category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_category
      @article_category = ArticleCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_category_params
      params.require(:article_category).permit(:name, :parent_id, :custom_key)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '分类管理', path: admin_article_categories_path, is_current: true}
      ] 
    end
end
