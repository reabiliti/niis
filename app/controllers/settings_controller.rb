class SettingsController < ApplicationController
  before_action :setting_find, only: [:show, :edit, :update, :destroy]

  def index
    @settings = Setting.all
  end

  def show
  end

  def new
    @setting = Setting.new
  end

  def edit
  end

  def create
    @setting = Setting.new(setting_params)
    @setting.save ? (redirect_to @setting) : (render 'new')
  end

  def update
    @setting.update(setting_params) ? (redirect_to @setting) : (render 'edit')
  end

  def destroy
    @setting.destroy
    redirect_to settings_path
  end

  private
    def setting_params
      params.require(:setting).permit(:set_name, :set_os_registration_num, :set_os_registration_date,
                                      :set_os_name, :set_os_address, :set_os_chief_position,
                                      :set_os_chief_name, :set_os_based_doc, :set_org_name,
                                      :set_org_address, :set_org_phone, :set_org_chief_position,
                                      :set_org_chief_name, :set_org_based_doc, :set_org_chief_accountant,
                                      :set_at_x, :set_at_y)
    end

    def setting_find
      @setting = Setting.find(params[:id])
    end

end
