# frozen_string_literal: true

# This controller for solution proposals certificate
class SolutionProposalsController < ApplicationController
  before_action :solution_proposal_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

  def show
    @proposal = @solution_proposal.proposal
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "solution_proposal_#{@solution_proposal.id}",
               template: 'solution_proposals/show.html.haml'
      end
    end
  end

  def new
    @solution_proposal = SolutionProposal.initialize_object(proposal_params)
  end

  def create
    @solution_proposal = SolutionProposal.new(solution_proposal_params)
    if @solution_proposal.save
      redirect_to @solution_proposal, flash: { success: t('solution_proposals.notices.success.create') }
    else
      flash.now[:danger] = t('solution_proposals.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @solution_proposal.update(solution_proposal_params)
      redirect_to @solution_proposal, flash: { success: t('solution_proposals.notices.success.update') }
    else
      flash.now[:danger] = t('solution_proposals.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @solution_proposal.destroy
    redirect_to root_path, flash: { success: t('solution_proposals.notices.success.destroy') }
  end

  private

  def proposal_params
    proposal = Proposal.find(params[:proposal_id])
    proposal.attributes.merge(proposal_id: proposal.id).merge(@setting.attributes)
  end

  def solution_proposal_params
    params.require(:solution_proposal).permit(:proposal_id, :number, :date_from, :decision_was_made,
                                              :applic_name_product, :applic_code_okp,
                                              :applic_code_tn_ved, :manuf_name,
                                              :manuf_address, :manuf_postcode,
                                              :manuf_doc, :manuf_list_doc,
                                              :manuf_regulations, :desc_scheme_cert,
                                              :test_lab, :sampling, :list_doc_product,
                                              :basis_work, :add_info, :os_chief_position,
                                              :os_chief_name, :expert, :executor,
                                              :applic_sign, :applic_name)
  end

  def solution_proposal_find
    @solution_proposal = SolutionProposal.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
