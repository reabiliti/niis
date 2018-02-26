class IkcontractsController < ApplicationController
  before_action :ikcontract_find, only: [ :show, :edit, :update, :destroy ]
  before_action :certificate_find, only: [ :show, :new ]
  before_action :setting_find, only: [ :show, :new ]

  def index
  end

  def show
  end

  def new
    @ikcontract = Ikcontract.new
    @ikcontract.certificate_id = @certificate.id
    @ikcontract.ikcon_registration_city = @setting.set_os_city
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_cert_registration_num = @certificate.cert_registration_num
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_name_product = @certificate.cert_name_product
    @ikcontract.ikcon_exec_name = @setting.set_org_name
  end

  def create
    @ikcontract = Ikcontract.new(ikcontract_params)
    @ikcontract.save ? (redirect_to ikcontract_path(@ikcontract, certificate_id: @ikcontract.certificate_id)) :
                       (render 'new')
  end

  def edit
  end

  def update
    @ikcontract.update(ikcontract_params) ? (redirect_to ikcontract_path(@ikcontract,
                                                                         certificate_id: @ikcontract.certificate_id)) :
                                            (render 'edit')
  end

  def destroy
    @ikcontract.destroy
    redirect_to root_path
  end

  private
  def ikcontract_params
    params.require(:ikcontract).permit(:certificate_id, :ikcon_registration_date, :ikcon_registration_num,
                                       :ikcon_registration_city, :ikcon_exec_name, :ikcon_exec_named,
                                       :ikcon_exec_chief, :ikcon_exec_active, :ikcon_exec_based_doc,
                                       :ikcon_client_name, :ikcon_client_named, :ikcon_client_chief,
                                       :ikcon_client_active, :ikcon_client_based_doc, :ikcon_name_product,
                                       :ikcon_cert_registration_num, :ikcon_inspection_period, :ikcon_contract_time,
                                       :ikcon_exec_address, :ikcon_exec_bank_details, :ikcon_client_address,
                                       :ikcon_client_bank_details)
  end

  def ikcontract_find
    @ikcontract = Ikcontract.find(params[:id])
  end

  def certificate_find
    @certificate = Certificate.find(params[:certificate_id])
  end

  def setting_find
    @setting = Setting.first
  end
end
