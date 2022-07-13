class Admin::SettingsController < Admin::ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy, :clear_home_bg]
  before_action :page_header, except: [:clear_home_bg]

  # GET /admin/settings
  # GET /admin/settings.json
  def index
    @settings = Setting.all
  end

  # GET /admin/settings/1
  # GET /admin/settings/1.json
  def show
    
  end

  # GET /admin/settings/new
  def new
    @setting = Setting.new
  end

  # GET /admin/settings/1/edit
  def edit
  end

  # POST /admin/settings
  # POST /admin/settings.json
  def create
    @setting = Setting.new(setting_params)

    respond_to do |format|
      if @setting.save

        format.html { redirect_to [:admin, @setting, 'index'], notice: 'Setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @setting }
      else
        format.html { render action: 'new' }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def clear_home_bg
    @setting.update(home_bg: nil)
    redirect_to edit_admin_setting_path(@setting.id)
  end

  # PATCH/PUT /admin/settings/1
  # PATCH/PUT /admin/settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        Log.create(title: "更新设置", user: current_user)
        format.html { redirect_to  [:edit, :admin, @setting], notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.first
      Setting.create unless @setting
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:logo, :tel, :address, :qrcode, :oa_path, :title, :description, :keywords, :icp, :email, :home_bg)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path}, 
        {name: '系统设置', path: edit_admin_setting_path, is_current: true}
      ] 
    end
end
