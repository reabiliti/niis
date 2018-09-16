# frozen_string_literal: true

# This controller manage protocols
class ProtocolsController < ApplicationController
  before_action :protocol_find, only: %i[show edit update destroy]

  def show
    @setting = Setting.first
    @solution_proposal = SolutionProposal.find(@protocol.solution_proposal_id)
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @solution_proposal = SolutionProposal.find(params[:solution_proposal_id])
    @protocol = Protocol.new
    @protocol.solution_proposal_id = @solution_proposal.id
    @protocol.prot_applic_name_product = @solution_proposal.applic_name_product
    @protocol.prot_applic_code_okp = @solution_proposal.applic_code_okp
    @protocol.prot_applic_code_tn_ved = @solution_proposal.applic_code_tn_ved
    @protocol.prot_manuf_name = @solution_proposal.manuf_name
    @protocol.prot_manuf_address = @solution_proposal.manuf_address
    @protocol.prot_manuf_postcode = @solution_proposal.manuf_postcode
    @protocol.prot_regulations_product = @solution_proposal.manuf_regulations
  end

  def create
    @protocol = Protocol.new(protocol_params)
    if @protocol.save
      redirect_to @protocol, flash: { success: t('protocols.notices.success.create') }
    else
      flash.now[:danger] = t('protocols.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @protocol.update(protocol_params)
      redirect_to @protocol, flash: { success: t('protocols.notices.success.update') }
    else
      flash.now[:danger] = t('protocols.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @protocol.destroy
    redirect_to root_path, flash: { success: t('protocols.notices.success.destroy') }
  end

  private

  def protocol_params
    params.require(:protocol).permit(:solution_proposal_id, :prot_date_from, :prot_applic_name_product,
                                     :prot_applic_code_okp, :prot_applic_code_tn_ved, :prot_manuf_name,
                                     :prot_manuf_address, :prot_manuf_postcode, :prot_origin_cert,
                                     :prot_info_product, :prot_date_issue_product, :prot_shelf_life,
                                     :prot_info_box, :prot_label_product, :prot_regulations_product,
                                     :prot_evaluation_product, :prot_requirement_test, :prot_list_indicators,
                                     :prot_conclusion, :prot_expert)
  end

  def protocol_find
    @protocol = Protocol.find(params[:id])
  end
end
