class Admin::ImageLinksController < Admin::ApplicationController
  before_action :set_image_link, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/image_links
  # GET /admin/image_links.json
  def index
    @image_links = ImageLink.all
  end

  # GET /admin/image_links/1
  # GET /admin/image_links/1.json
  def show
  end

  # GET /admin/image_links/new
  def new
    @image_link = ImageLink.new
  end

  # GET /admin/image_links/1/edit
  def edit
  end

  # POST /admin/image_links
  # POST /admin/image_links.json
  def create
    @image_link = ImageLink.new(image_link_params)
    Log.create(title: "添加数据平台", user: current_user, desc: @image_link.link )
    respond_to do |format|
      if @image_link.save
        format.html { redirect_to admin_image_links_url, notice: 'Image link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/image_links/1
  # PATCH/PUT /admin/image_links/1.json
  def update
    respond_to do |format|
      if @image_link.update(image_link_params)
        Log.create(title: "更新数据平台", user: current_user, desc: @image_link.link )
        format.html { redirect_to admin_image_links_url, notice: 'Image link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/image_links/1
  # DELETE /admin/image_links/1.json
  def destroy
    @image_link.destroy
    respond_to do |format|
      Log.create(title: "删除数据平台", user: current_user, desc: @image_link.link )
      format.html { redirect_to admin_image_links_url, notice: 'Image link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_link
      @image_link = ImageLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_link_params
      params.require(:image_link).permit(:path, :link, :position)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '链接管理', path: admin_group_banners_path, is_current: true}
      ] 
    end
end
