# frozen_string_literal: true

# This is class to certificates
class CertificatesController < ApplicationController
  before_action :certificate_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

  def show
    @solution = @certificate.solution
    @conclusion = @solution.conclusion
    @solution_proposal = @conclusion.solution_proposal
    @proposal = @solution_proposal.proposal
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CertificatePdf.new(@certificate, @setting, @proposal)
        send_data pdf.render,
                  filename: "certificate_#{@certificate.cert_registration_num}",
                  type: 'application/pdf',
                  disposition: 'inline',
                  page_layout: 'landscape'
      end
    end
  end

  def new
    @solution = Solution.find(params[:solution_id])
    @conclusion = @solution.conclusion
    @solution_proposal = @conclusion.solution_proposal
    @proposal = @solution_proposal.proposal
    @certificate = Certificate.new
    @certificate.solution_id = @solution.id
    @certificate.cert_expiry_date = @solution.sol_cert_expiry_date
    @certificate.cert_manuf_doc = @solution.sol_manuf_doc
    @certificate.cert_code_okp = @solution.sol_code_okp
    @certificate.cert_code_tn_ved = @solution.sol_code_tn_ved
    @certificate.cert_manuf_regulations = @solution.sol_manuf_regulations
    @certificate.cert_manuf_name = @solution.sol_manuf_name
    @certificate.cert_manuf_inn = @proposal.manuf_inn
    @certificate.cert_manuf_address = @solution.sol_manuf_address
    @certificate.cert_manuf_postcode = @solution.sol_manuf_postcode
    @certificate.cert_applic_name = @proposal.applic_name
    @certificate.cert_applic_inn = @proposal.applic_inn
    @certificate.cert_applic_address = @proposal.applic_address
    @certificate.cert_applic_postcode = @proposal.applic_postcode
    @certificate.cert_applic_phone = @proposal.applic_phone
    @certificate.cert_test_report = @solution.sol_test_report
    @certificate.cert_add_info = @solution.sol_add_info
    @certificate.cert_place_marking = @solution.sol_place_marking
    @certificate.cert_chief_org = @setting.os_chief_name
    @certificate.cert_expert = @solution.sol_expert
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to @certificate, flash: { success: t('certificates.notices.success.create') }
    else
      flash.now[:danger] = t('certificates.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @certificate.update(certificate_params)
      redirect_to @certificate, flash: { success: t('certificates.notices.success.update') }
    else
      flash.now[:danger] = t('certificates.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @certificate.destroy
    redirect_to root_path, flash: { success: t('certificates.notices.success.destroy') }
  end

  private

  def certificate_params
    params.require(:certificate).permit(:solution_id, :cert_expiry_date, :cert_name_product,
                                        :cert_manuf_regulations, :cert_code_okp, :cert_code_tn_ved,
                                        :cert_manuf_doc, :cert_manuf_name, :cert_manuf_inn,
                                        :cert_manuf_address, :cert_manuf_postcode,
                                        :cert_test_report, :cert_add_info, :cert_place_marking,
                                        :cert_chief_org, :cert_expert, :cert_registration_date,
                                        :cert_registration_num, :cert_blank_num, :cert_applic_name,
                                        :cert_applic_inn, :cert_applic_address, :cert_applic_postcode,
                                        :cert_applic_phone, :cert_name_product_size_font)
  end

  def certificate_find
    @certificate = Certificate.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
