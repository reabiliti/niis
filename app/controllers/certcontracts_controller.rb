# frozen_string_literal: true

# This class to contracts certificates
class CertcontractsController < ApplicationController
  before_action :certcontract_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

  def show
    @proposal = Proposal.find(@certcontract.proposal_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "certcontract_#{@certcontract.id}",
               template: 'certcontracts/show.html.haml'
      end
    end
  end

  def new
    @certcontract = Certcontract.initialize_object(proposal_params)
  end

  def create
    @certcontract = Certcontract.new(certcontract_params)
    if @certcontract.save
      redirect_to @certcontract, flash: { success: t('certcontracts.notices.success.create') }
    else
      flash.now[:danger] = t('certcontracts.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @certcontract.update(certcontract_params)
      redirect_to @certcontract, flash: { success: t('certcontracts.notices.success.update') }
    else
      flash.now[:danger] = t('certcontracts.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @certcontract.destroy
    redirect_to root_path, flash: { success: t('certcontracts.notices.success.destroy') }
  end

  private

  def proposal_params
    proposal = Proposal.find(params[:proposal_id])
    proposal.attributes.merge(proposal_id: proposal.id,
                              org_chief_name_sign: @setting.org_chief_name,
                              org_chief_position_sign: @setting.org_chief_position,
                              applic_chief_name_sign: proposal.applic_chief_name,
                              applic_chief_position_sign: proposal.applic_chief_position
                             ).merge(@setting.attributes)
  end

  def certcontract_params
    params.require(:certcontract).permit(:proposal_id, :org_chief_name_sign,
                                         :registration_date, :registration_num,
                                         :os_city, :org_name, :org_named,
                                         :org_chief_position, :org_chief_name, :org_active,
                                         :org_based_doc, :applic_name, :applic_named,
                                         :applic_chief_position, :applic_chief_name,
                                         :applic_active, :applic_based_doc, :applic_name_product,
                                         :date_from, :date_expiry, :org_address, :org_postcode,
                                         :org_bank_details, :applic_address, :applic_postcode,
                                         :applic_bank_details, :org_chief_position_sign,
                                         :org_chief_name_sign, :applic_chief_position_sign,
                                         :applic_chief_name_sign, :price_work, :price_work_total)
  end

  def certcontract_find
    @certcontract = Certcontract.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
