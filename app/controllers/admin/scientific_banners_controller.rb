class Admin::ScientificBannersController < Admin::ApplicationController
  before_action :set_scientific_banner, only: [:show, :edit, :update, :destroy]

  # GET /admin/scientific_banners
  # GET /admin/scientific_banners.json
  def index
    @scientific_banners = ScientificBanner.all
  end

  # GET /admin/scientific_banners/1
  # GET /admin/scientific_banners/1.json
  def show
  end

  # GET /admin/scientific_banners/new
  def new
    @scientific_banner = ScientificBanner.new
  end

  # GET /admin/scientific_banners/1/edit
  def edit
  end

  # POST /admin/scientific_banners
  # POST /admin/scientific_banners.json
  def create
    @scientific_banner = ScientificBanner.new(scientific_banner_params)

    respond_to do |format|
      if @scientific_banner.save
        format.html { redirect_to [:admin, @scientific_banner], notice: 'Scientific banner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scientific_banner }
      else
        format.html { render action: 'new' }
        format.json { render json: @scientific_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/scientific_banners/1
  # PATCH/PUT /admin/scientific_banners/1.json
  def update
    respond_to do |format|
      if @scientific_banner.update(scientific_banner_params)
        format.html { redirect_to [:admin, @scientific_banner], notice: 'Scientific banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scientific_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/scientific_banners/1
  # DELETE /admin/scientific_banners/1.json
  def destroy
    @scientific_banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_scientific_banners_url, notice: 'Scientific banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientific_banner
      @scientific_banner = ScientificBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scientific_banner_params
      params.require(:scientific_banner).permit(:path, :link, :position)
    end
end
