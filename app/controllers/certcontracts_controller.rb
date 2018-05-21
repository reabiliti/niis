# frozen_string_literal: true

# This class to contracts certificates
class CertcontractsController < ApplicationController
  before_action :cecon_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]
  before_action :logged_in_user

  def show
    @proposal = Proposal.find(@certcontract.proposal_id)
  end

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @certcontract = Certcontract.new
    @certcontract.proposal_id = @proposal.id
    @certcontract.cecon_registration_city = @setting.set_os_city
    @certcontract.cecon_name_product = @proposal.prop_applic_name_product
    @certcontract.cecon_exec_name = @setting.set_org_name
    @certcontract.cecon_exec_chief_position = @setting.set_org_chief_position
    @certcontract.cecon_exec_chief_position_sign = @setting.set_org_chief_position
    @certcontract.cecon_exec_chief_name = @setting.set_org_chief_name
    @certcontract.cecon_exec_chief_name_sign = @setting.set_org_chief_name
    @certcontract.cecon_exec_based_doc = @setting.set_org_based_doc
    @certcontract.cecon_exec_address = @setting.set_org_address
    @certcontract.cecon_client_name = @proposal.prop_applic_name
    @certcontract.cecon_client_chief_name = @proposal.prop_applic_chief
    @certcontract.cecon_client_chief_name_sign = @proposal.prop_applic_chief
    @certcontract.cecon_client_address = "#{@proposal.prop_applic_address}, #{@proposal.prop_manuf_postcode}"
  end

  def create
    @certcontract = Certcontract.new(cecon_params)
    if @certcontract.save
      redirect_to @certcontract, flash: { success: 'Договор на проведение работ по сертификации создан успешно' }
    else
      flash.now[:danger] = 'Не удалось создать договор на проведение работ по сертификации, проверьте вводимые данные'
      render 'new'
    end
  end

  def edit; end

  def update
    if @certcontract.update(cecon_params)
      redirect_to @certcontract, flash: { success: 'Договор на проведение работ по сертификации успешно обновлен' }
    else
      flash.now[:danger] = 'Не удалось обновить договор на проведение работ по сертификации, проверьте вводимые данные'
      render 'new'
    end
  end

  def destroy
    @certcontract.destroy
    redirect_to root_path, flash: { success: 'Договор на проведение работ по сертификации удален успешно' }
  end

  private

  def cecon_params
    params.require(:certcontract).permit(:proposal_id, :cecon_exec_chief_name_sign,
                                         :cecon_registration_date, :cecon_registration_num,
                                         :cecon_registration_city, :cecon_exec_name, :cecon_exec_named,
                                         :cecon_exec_chief_position, :cecon_exec_chief_name, :cecon_exec_active,
                                         :cecon_exec_based_doc, :cecon_client_name, :cecon_client_named,
                                         :cecon_client_chief_position, :cecon_client_chief_name,
                                         :cecon_client_active, :cecon_client_based_doc, :cecon_name_product,
                                         :cecon_date_from, :cecon_date_expiry, :cecon_exec_address,
                                         :cecon_exec_bank_details, :cecon_client_address, :cecon_client_bank_details,
                                         :cecon_exec_chief_position_sign, :cecon_exec_chief_name_sign,
                                         :cecon_client_chief_position_sign, :cecon_client_chief_name_sign,
                                         :cecon_price_work, :cecon_price_work_total)
  end

  def cecon_find
    @certcontract = Certcontract.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
