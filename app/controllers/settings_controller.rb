# frozen_string_literal: true

# This class settings application
class SettingsController < ApplicationController
  before_action :setting_find, only: %i[show edit update]
  before_action :logged_in_user

  def show; end

  def new
    @setting = Setting.new
  end

  def edit; end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to @setting, flash: { success: 'Настройки для приложения созданы успешно' }
    else
      flash.now[:danger] = 'Настройки для приложения не создались, просьба проверить вводимые данные'
      render 'new'
    end
  end

  def update
    if @setting.update(setting_params)
      redirect_to @setting, flash: { success: 'Настройки обновлены успешно' }
    else
      flash.now[:danger] = 'Настройки не смогли обновиться'
      render 'edit'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:set_name, :set_os_registration_num, :set_os_registration_date,
                                    :set_os_name, :set_os_address, :set_os_chief_position,
                                    :set_os_chief_name, :set_os_based_doc, :set_org_name,
                                    :set_org_address, :set_os_city, :set_org_phone, :set_org_chief_position,
                                    :set_org_chief_name, :set_org_based_doc, :set_org_chief_accountant,
                                    :set_at_x, :set_at_y)
  end

  def setting_find
    @setting = Setting.find(params[:id])
  end
end
