class ConclusionsController < ApplicationController
  before_action :conc_find, only: [ :show, :edit, :update, :destroy ]
  before_action :solprop_find, only: [ :show, :new ]

  def index
    @conclusions = Conclusion.all
  end

  def show
    @setting = Setting.first
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @conclusion = Conclusion.new
    @conclusion.solution_proposal_id = @solution_proposal.id
    @conclusion.conc_solution_num = @solution_proposal.solprop_number
    @conclusion.conc_solution_date = @solution_proposal.solprop_date_from
    @conclusion.conc_name_product = @solution_proposal.solprop_applic_name_product
    @conclusion.conc_code_okp = @solution_proposal.solprop_applic_code_okp
    @conclusion.conc_tn_ved = @solution_proposal.solprop_applic_code_tn_ved
    @conclusion.conc_manuf_name = @solution_proposal.solprop_manuf_name
    @conclusion.conc_manuf_address = @solution_proposal.solprop_manuf_address
    @conclusion.conc_manuf_postcode = @solution_proposal.solprop_manuf_postcode
    @conclusion.conc_manuf_doc = @solution_proposal.solprop_manuf_doc
    @conclusion.conc_manuf_regulations = @solution_proposal.solprop_regulations
    @conclusion.conc_desc_scheme_cert = @solution_proposal.solprop_desc_scheme_cert
    @conclusion.conc_list_doc = @solution_proposal.solprop_list_doc_product

  end

  def create
    @conclusion = Conclusion.new(conc_params)
    @conclusion.save ? (redirect_to conclusion_path(@conclusion,
                        solution_proposal_id: @conclusion.solution_proposal_id)) : (render 'new')
  end

  def edit
  end

  def update
    @conclusion.update(conc_params) ? (redirect_to conclusion_path(@conclusion,
                                       solution_proposal_id: @conclusion.solution_proposal_id)) : (render 'new')
  end

  def destroy
    @conclusion.destroy
    redirect_to root_path
  end

  private
  def conc_params
    params.require(:conclusion).permit(:conc_solution_num, :conc_solution_date, :conc_contract_num,
                                       :conc_contract_date, :conc_directive_num, :conc_directive_date,
                                       :conc_name_product, :conc_code_okp, :conc_tn_ved, :conc_manuf_name,
                                       :conc_manuf_address, :conc_manuf_postcode, :conc_manuf_doc,
                                       :conc_manuf_regulations, :conc_desc_scheme_cert, :conc_test_report,
                                       :conc_list_doc, :conc_conformity, :conc_may_be_issued, :conc_expiry_date,
                                       :conc_add_info, :conc_attachment, :conc_expert, :conc_sign_date,
                                       :solution_proposal_id)
  end

  def conc_find
    @conclusion = Conclusion.find(params[:id])
  end

  def solprop_find
    @solution_proposal = SolutionProposal.find(params[:solution_proposal_id])
  end

end
