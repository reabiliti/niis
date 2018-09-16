# frozen_string_literal: true

# This controller manage proposals
class ProposalsController < ApplicationController
  before_action :proposal_find, only: %i[show edit update destroy]

  def show
    @setting = Setting.first
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to @proposal, flash: { success: t('proposals.notices.success.create') }
    else
      flash.now[:danger] = t('proposals.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, flash: { success: t('proposals.notices.success.update') }
    else
      flash.now[:danger] = t('proposals.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to root_path, flash: { success: t('proposals.notices.success.destroy') }
  end

  private

  def proposal_params
    params.require(:proposal).permit(:number, :date_from, :cert_system, :applic_name,
                                     :applic_reg_doc, :applic_address, :applic_bank_detail,
                                     :applic_phone, :applic_fax, :applic_email, :applic_code_okato,
                                     :applic_type_own, :applic_code_okonh, :applic_code_okved,
                                     :applic_code_okpo, :applic_chief, :applic_name_product,
                                     :applic_from_issue, :manuf_name, :manuf_address, :manuf_doc,
                                     :manuf_code_okato, :manuf_type_own, :manuf_code_okonh,
                                     :manuf_code_okved, :manuf_code_okpo, :manuf_regulations,
                                     :manuf_list_doc, :manuf_add_info, :manuf_chief_org,
                                     :manuf_chief_accountant, :applic_postcode, :applic_inn,
                                     :applic_kpp, :applic_code_okp, :applic_code_tn_ved,
                                     :manuf_postcode, :manuf_inn, :manuf_scheme_cert,
                                     :manuf_count_sort_cert, :manuf_group_complexity)
  end

  def proposal_find
    @proposal = Proposal.find(params[:id])
  end
end
