class Admin::LinksController < Admin::ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :page_header
  # GET /admin/links
  # GET /admin/links.json
  def index
    @links = Link.where(category: params[:category])
  end

  # GET /admin/links/1
  # GET /admin/links/1.json
  def show
  end

  # GET /admin/links/new
  def new
    @link = Link.new(category: params[:category])
  end

  # GET /admin/links/1/edit
  def edit
  end

  # POST /admin/links
  # POST /admin/links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to admin_links_path(category: @link.category), notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/links/1
  # PATCH/PUT /admin/links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to admin_links_path(category: @link.category), notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/links/1
  # DELETE /admin/links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to admin_links_path(category: @link.category), notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:path, :name, :category)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '链接管理', path: admin_swipers_path, is_current: true}
      ] 
    end
end
