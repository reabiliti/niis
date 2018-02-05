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
      params.require(:setting).permit(:set_name, :set_organization, :set_address, :set_at_x, :set_at_y)
    end

    def setting_find
      @setting = Setting.find(params[:id])
    end

end
