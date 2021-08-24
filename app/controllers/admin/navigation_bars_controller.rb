class Admin::NavigationBarsController < Admin::ApplicationController
  before_action :set_navigation_bar, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/navigation_bars
  # GET /admin/navigation_bars.json
  def index
    @navigation_bars = NavigationBar.all
  end

  # GET /admin/navigation_bars/1
  # GET /admin/navigation_bars/1.json
  def show
  end

  # GET /admin/navigation_bars/new
  def new
    @navigation_bar = NavigationBar.new
  end

  # GET /admin/navigation_bars/1/edit
  def edit
  end

  # POST /admin/navigation_bars
  # POST /admin/navigation_bars.json
  def create
    @navigation_bar = NavigationBar.new(navigation_bar_params)

    respond_to do |format|
      if @navigation_bar.save
        format.html { redirect_to [:admin, @navigation_bar], notice: 'Navigation bar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @navigation_bar }
      else
        format.html { render action: 'new' }
        format.json { render json: @navigation_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/navigation_bars/1
  # PATCH/PUT /admin/navigation_bars/1.json
  def update
    respond_to do |format|
      if @navigation_bar.update(navigation_bar_params)
        format.html { redirect_to [:admin, @navigation_bar], notice: 'Navigation bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @navigation_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/navigation_bars/1
  # DELETE /admin/navigation_bars/1.json
  def destroy
    @navigation_bar.destroy
    respond_to do |format|
      format.html { redirect_to admin_navigation_bars_url, notice: 'Navigation bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navigation_bar
      @navigation_bar = NavigationBar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def navigation_bar_params
      params.require(:navigation_bar).permit(:name, :url, :custom_order)
    end
      
    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '导航列表', path: admin_navigation_bars_path, is_current: true}
      ] 
    end
end
