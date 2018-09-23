# frozen_string_literal: true

# Class to mabage conclusions experts certificates
class ConclusionsController < ApplicationController
  before_action :conclusion_find, only: %i[show edit update destroy]

  def show
    @setting = Setting.first
    @solution_proposal = SolutionProposal.find(@conclusion.solution_proposal_id)
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @conclusion = Conclusion.initialize_object(solution_proposal_params)
  end

  def create
    @conclusion = Conclusion.new(conclusion_params)
    if @conclusion.save
      redirect_to @conclusion, flash: { success: t('conclusions.notices.success.create') }
    else
      flash.now[:danger] = t('conclusions.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @conclusion.update(conclusion_params)
      redirect_to @conclusion, flash: { success: t('conclusions.notices.success.update') }
    else
      flash.now[:danger] = t('conclusions.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @conclusion.destroy
    redirect_to root_path, flash: { success: t('conclusions.notices.success.destroy') }
  end

  private

  def solution_proposal_params
    solution_proposal = SolutionProposal.find(params[:solution_proposal_id])
    solution_proposal.attributes.merge(solution_proposal_id: solution_proposal.id)
  end

  def conclusion_params
    params.require(:conclusion).permit(:number, :date_from, :contract_num,
                                       :contract_date, :directive_num, :directive_date,
                                       :applic_name_product, :applic_code_okp, :applic_code_tn_ved,
                                       :manuf_name, :manuf_address, :manuf_postcode, :manuf_doc,
                                       :manuf_regulations, :desc_scheme_cert, :test_report,
                                       :list_doc_product, :conformity, :may_be_issued, :cert_expiry_date,
                                       :add_info, :attachment, :expert, :sign_date,
                                       :solution_proposal_id)
  end

  def conclusion_find
    @conclusion = Conclusion.find(params[:id])
  end
end
