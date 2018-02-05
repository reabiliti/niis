class ProposalsController < ApplicationController
  before_action :proposal_find, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = Proposal.all
  end

  def show
    @setting = Setting.first
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.save ? (redirect_to @proposal) : (render 'new')
  end

  def edit
  end

  def update
    @proposal.update(proposal_params) ? (redirect_to @proposal) : (render 'edit')
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path
  end

  private
  def proposal_params
    params.require(:proposal).permit(:prop_number, :prop_date_from, :prop_cert_system, :prop_applic_name,
                                     :prop_applic_reg_doc, :prop_applic_address, :prop_applic_postcode,
                                     :prop_applic_bank_detail, :prop_applic_phone, :prop_applic_fax,
                                     :prop_applic_email, :prop_applic_code_okato, :prop_applic_type_own,
                                     :prop_applic_code_okonh, :prop_applic_code_okved, :prop_applic_code_okpo,
                                     :prop_applic_inn, :prop_applic_kpp, :prop_applic_chief,
                                     :prop_applic_name_product, :prop_applic_code_okp, :prop_applic_code_tn_ved,
                                     :prop_applic_from_issue, :prop_manuf_name, :prop_manuf_address,
                                     :prop_manuf_postcode, :prop_manuf_doc, :prop_manuf_code_okato,
                                     :prop_manuf_type_own, :prop_manuf_code_okonh, :prop_manuf_code_okved,
                                     :prop_manuf_code_okpo, :prop_manuf_inn, :prop_manuf_regulations,
                                     :prop_manuf_scheme_cert, :prop_manuf_count_sort_cert,
                                     :prop_manuf_group_complexity, :prop_manuf_list_doc, :prop_manuf_add_info,
                                     :prop_manuf_chief_org, :prop_manuf_chief_accountant)
  end

  def proposal_find
    @proposal = Proposal.find(params[:id])
  end
end
