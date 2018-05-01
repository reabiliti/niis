class ProtocolsController < ApplicationController
  before_action :protocol_find, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
    @protocols = Protocol.all
  end

  def show
    @setting = Setting.first
    @solution_proposal = SolutionProposal.find(@protocol.solution_proposal_id)
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @solution_proposal = SolutionProposal.find(params[:solution_proposal_id])
    @protocol = Protocol.new
    @protocol.solution_proposal_id = @solution_proposal.id
    @protocol.prot_applic_name_product = @solution_proposal.solprop_applic_name_product
    @protocol.prot_applic_code_okp = @solution_proposal.solprop_applic_code_okp
    @protocol.prot_applic_code_tn_ved = @solution_proposal.solprop_applic_code_tn_ved
    @protocol.prot_manuf_name = @solution_proposal.solprop_manuf_name
    @protocol.prot_manuf_address = @solution_proposal.solprop_manuf_address
    @protocol.prot_manuf_postcode = @solution_proposal.solprop_manuf_postcode
    @protocol.prot_regulations_product = @solution_proposal.solprop_regulations
  end

  def create
    @protocol = Protocol.new(protocol_params)
    @protocol.save ? (redirect_to @protocol) : (render 'new')
  end

  def edit; end

  def update
    @protocol.update(protocol_params) ? (redirect_to @protocol) : (render 'edit')
  end

  def destroy
    @protocol.destroy
    redirect_to root_path
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
