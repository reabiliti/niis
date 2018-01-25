class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def show
    @setting = setting_find
  end

  def new
    @setting = Setting.new
  end

  def edit
    @setting = setting_find
  end

  def create
    @setting = Setting.new(setting_params)
    @setting.save ? (redirect_to @setting) : (render 'new')
  end

  def update
    @setting = setting_find
    @setting.update(setting_params) ? (redirect_to @setting) : (render 'edit')
  end

  def destroy
    @setting = setting_find
    @setting.destroy
    redirect_to settings_path
  end

  private
    def setting_params
      params.require(:setting).permit(:set_name, :set_organization, :set_indent_down)
    end

    def setting_find
      Setting.find(params[:id])
    end

end
