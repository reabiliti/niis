class SolutionProposalsController < ApplicationController
  before_action :solprop_find, only: [:show, :edit, :update, :destroy]

  def index
    @solution_proposals = SolutionProposal.all
  end

  def show
    @proposal = Proposal.find(@solution_proposal.proposal_id)
    @setting = Setting.first
  end

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @solution_proposal = SolutionProposal.new
    @solution_proposal.proposal_id = @proposal.id
    @solution_proposal.solprop_number = @proposal.prop_number
    @solution_proposal.solprop_applic_name_product = @proposal.prop_applic_name_product
    @solution_proposal.solprop_applic_code_okp = @proposal.prop_applic_code_okp
    @solution_proposal.solprop_applic_code_tn_ved = @proposal.prop_applic_code_tn_ved
    @solution_proposal.solprop_manuf_name = @proposal.prop_manuf_name
    @solution_proposal.solprop_manuf_address = @proposal.prop_manuf_address
    @solution_proposal.solprop_manuf_postcode = @proposal.prop_manuf_postcode
    @solution_proposal.solprop_manuf_doc = @proposal.prop_manuf_doc
    @solution_proposal.solprop_manuf_list_doc = @proposal.prop_manuf_list_doc
    @solution_proposal.solprop_regulations = @proposal.prop_manuf_regulations
    @solution_proposal.solprop_applic_name = @proposal.prop_applic_name
  end

  def create
    @solution_proposal = SolutionProposal.new(solprop_params)
    @solution_proposal.save ? (redirect_to @solution_proposal) : (render 'new')
  end

  def edit
  end

  def update
    @solution_proposal.update(solprop_params) ? (redirect_to @solution_proposal) : (render 'edit')
  end

  def destroy
    @solution_proposal.destroy
    redirect_to root_path
  end

  private
  def solprop_params
    params.require(:solution_proposal).permit(:proposal_id, :solprop_number, :solprop_date_from, :solprop_solution,
                                               :solprop_applic_name_product, :solprop_applic_code_okp,
                                               :solprop_applic_code_tn_ved, :solprop_manuf_name,
                                               :solprop_manuf_address, :solprop_manuf_postcode,
                                               :solprop_manuf_doc, :solprop_manuf_list_doc,
                                               :solprop_regulations, :solprop_desc_scheme_cert,
                                               :solprop_test_lab, :solprop_sampling, :solprop_list_doc_product,
                                               :solprop_basis_work, :solprop_add_info, :solprop_chief_name,
                                               :solprop_chief_org, :solprop_expert, :solprop_executor,
                                               :solprop_applic_sign, :solprop_applic_name)
  end

  def solprop_find
    @solution_proposal = SolutionProposal.find(params[:id])
  end
end
