class Admin::ArticlesController < Admin::ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    if params[:article_category_id]
      categories = ArticleCategory.find(params[:article_category_id]).self_and_descendants
      @articles = Article.where(article_category_id: categories.pluck(:id))
    
    else
      @articles = Article.all
    end
    
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles/images
  def images
    image = Image.new(file: params['image']['attachment'])
    if image.save
      render json: {status: 'success', url: image.file.url}
    else
      render json: {status: 'error', msg: '上传失败'}
    end
  end

  # POST /admin/articles
  # POST /admin/articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1
  # PATCH/PUT /admin/articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :content, :brief, :article_category_id)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '文章管理', path: admin_articles_path, is_current: true}
      ] 
    end
end
