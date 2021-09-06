class Admin::OrganizationsController < Admin::ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :page_header

  # GET /admin/organizations
  # GET /admin/organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /admin/organizations/1
  # GET /admin/organizations/1.json
  def show
  end

  # GET /admin/organizations/new
  def new
    @organization = Organization.new
  end

  # GET /admin/organizations/1/edit
  def edit
  end

  # POST /admin/organizations
  # POST /admin/organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to [:admin, @organization], notice: 'Organization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/organizations/1
  # PATCH/PUT /admin/organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to [:admin, @organization], notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/organizations/1
  # DELETE /admin/organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to admin_organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:title, :content, :position)
    end

    def page_header
      @page_header =  [
        {name: '首页', path: admin_root_path},
        {name: '组织架构', path: admin_organizations_path, is_current: true}
      ]
    end
end
