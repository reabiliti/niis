# frozen_string_literal: true

# This class settings application
class SettingsController < ApplicationController
  before_action :setting_find, only: %i[show edit update]

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
    params.require(:setting).permit(:name, :os_registration_num, :os_registration_date,
                                    :os_name, :os_address, :os_chief_position,
                                    :os_chief_name, :os_based_doc, :org_name,
                                    :org_address, :os_city, :org_phone, :org_chief_position,
                                    :org_chief_name, :org_based_doc, :org_chief_accountant,
                                    :at_x, :at_y)
  end

  def setting_find
    @setting = Setting.find(params[:id])
  end
end
