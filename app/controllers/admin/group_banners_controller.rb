class Admin::GroupBannersController < Admin::ApplicationController
  before_action :set_group_banner, only: [:show, :edit, :update, :destroy]

  # GET /admin/group_banners
  # GET /admin/group_banners.json
  def index
    @group_banners = GroupBanner.all
  end

  # GET /admin/group_banners/1
  # GET /admin/group_banners/1.json
  def show
  end

  # GET /admin/group_banners/new
  def new
    @group_banner = GroupBanner.new
  end

  # GET /admin/group_banners/1/edit
  def edit
  end

  # POST /admin/group_banners
  # POST /admin/group_banners.json
  def create
    @group_banner = GroupBanner.new(group_banner_params)

    respond_to do |format|
      if @group_banner.save
        format.html { redirect_to [:admin, @group_banner], notice: 'Group banner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group_banner }
      else
        format.html { render action: 'new' }
        format.json { render json: @group_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/group_banners/1
  # PATCH/PUT /admin/group_banners/1.json
  def update
    respond_to do |format|
      if @group_banner.update(group_banner_params)
        format.html { redirect_to [:admin, @group_banner], notice: 'Group banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/group_banners/1
  # DELETE /admin/group_banners/1.json
  def destroy
    @group_banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_group_banners_url, notice: 'Group banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_banner
      @group_banner = GroupBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_banner_params
      params.require(:group_banner).permit(:path, :link, :position)
    end
end
