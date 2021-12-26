class Admin::SwipersController < Admin::ApplicationController
  before_action :set_swiper, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/swipers
  # GET /admin/swipers.json
  def index
    @swipers = Swiper.all.order(position: :desc)
  end

  # GET /admin/swipers/1
  # GET /admin/swipers/1.json
  def show
  end

  # GET /admin/swipers/new
  def new
    @swiper = Swiper.new
  end

  # GET /admin/swipers/1/edit
  def edit
  end

  # POST /admin/swipers
  # POST /admin/swipers.json
  def create
    @swiper = Swiper.new(swiper_params)

    respond_to do |format|
      if @swiper.save
        format.html { redirect_to admin_swipers_path, notice: 'Swiper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @swiper }
      else
        format.html { render action: 'new' }
        format.json { render json: @swiper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/swipers/1
  # PATCH/PUT /admin/swipers/1.json
  def update
    respond_to do |format|
      if @swiper.update(swiper_params)
        format.html { redirect_to admin_swipers_path, notice: 'Swiper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swiper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/swipers/1
  # DELETE /admin/swipers/1.json
  def destroy
    @swiper.destroy
    respond_to do |format|
      format.html { redirect_to admin_swipers_url, notice: 'Swiper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swiper
      @swiper = Swiper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swiper_params
      params.require(:swiper).permit(:title, :url, :position, :link, :category)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '轮播图', path: admin_swipers_path, is_current: true}
      ] 
    end
end
