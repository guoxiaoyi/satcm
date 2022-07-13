class Admin::AccountsController < Admin::ApplicationController
  def index
  end
  def new
    @account = User.new
  end
  def show
    set_manager
  end
  def create
    @account = User.new(manager_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to admin_accounts_path, notice: 'Manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    set_manager
  end

  def update
    set_manager
    respond_to do |format|
      if @account.update(manager_params)
        format.html { redirect_to admin_accounts_path, notice: 'Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_manager
    if @account.perms != 'su'
      User.find(params[:id]).destroy
      redirect_to admin_accounts_path
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @account = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :supper, :disabled, :perm)
    end
end
