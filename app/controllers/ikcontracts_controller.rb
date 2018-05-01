class IkcontractsController < ApplicationController
  before_action :ikcontract_find, only: [:show, :edit, :update, :destroy]
  before_action :setting_find, only: [:show, :new]
  before_action :logged_in_user

  def index
  end

  def show
    @certificate = Certificate.find(@ikcontract.certificate_id)
  end

  def new
    @certificate = Certificate.find(params[:certificate_id])
    @ikcontract = Ikcontract.new
    @ikcontract.certificate_id = @certificate.id
    @ikcontract.ikcon_registration_city = @setting.set_os_city
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_cert_registration_num = @certificate.cert_registration_num
    @ikcontract.ikcon_exec_name = @setting.set_org_name
    @ikcontract.ikcon_exec_chief_position = @setting.set_org_chief_position
    @ikcontract.ikcon_exec_chief_position_sign = @setting.set_org_chief_position
    @ikcontract.ikcon_exec_chief_name = @setting.set_org_chief_name
    @ikcontract.ikcon_exec_chief_name_sign = @setting.set_org_chief_name
    @ikcontract.ikcon_exec_based_doc = @setting.set_org_based_doc
    @ikcontract.ikcon_exec_address = @setting.set_org_address
    @ikcontract.ikcon_client_name = @certificate.cert_manuf_name
    @ikcontract.ikcon_client_chief_name = @certificate.cert_manuf_name
    @ikcontract.ikcon_client_chief_name_sign = @certificate.cert_manuf_name
    @ikcontract.ikcon_client_address = "#{@certificate.cert_manuf_address}, \
                                        #{@certificate.cert_manuf_postcode}"
  end

  def create
    @ikcontract = Ikcontract.new(ikcontract_params)
    @ikcontract.save ? (redirect_to @ikcontract) : (render 'new')
  end

  def edit
  end

  def update
    @ikcontract.update(ikcontract_params) ? (redirect_to @ikcontract) : (render 'edit')
  end

  def destroy
    @ikcontract.destroy
    redirect_to root_path
  end

  private

  def ikcontract_params
    params.require(:ikcontract).permit(:certificate_id, :ikcon_registration_date, :ikcon_registration_num,
                                       :ikcon_registration_city, :ikcon_exec_name, :ikcon_exec_named,
                                       :ikcon_exec_chief_position, :ikcon_exec_chief_position_sign,
                                       :ikcon_exec_chief_name, :ikcon_exec_chief_name_sign, :ikcon_exec_active,
                                       :ikcon_exec_based_doc, :ikcon_client_name, :ikcon_client_named,
                                       :ikcon_client_chief_position, :ikcon_client_chief_position_sign,
                                       :ikcon_client_chief_name, :ikcon_client_chief_name_sign,
                                       :ikcon_client_active, :ikcon_client_based_doc, :ikcon_name_product,
                                       :ikcon_cert_registration_num, :ikcon_inspection_period,
                                       :ikcon_contract_time, :ikcon_exec_address, :ikcon_exec_bank_details,
                                       :ikcon_client_address, :ikcon_client_bank_details)
  end

  def ikcontract_find
    @ikcontract = Ikcontract.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
