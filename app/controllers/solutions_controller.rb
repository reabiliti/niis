# frozen_string_literal: true

class SolutionsController < ApplicationController
  before_action :sol_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]
  before_action :logged_in_user

  def index; end

  def show
    @conclusion = Conclusion.find(@solution.conclusion_id)
    @solution_proposal = SolutionProposal.find(@conclusion.solution_proposal_id)
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @conclusion = Conclusion.find(params[:conclusion_id])
    @solution = Solution.new
    @solution.conclusion_id = @conclusion.id
    @solution.sol_solution_proposal_num = @conclusion.conc_solution_proposal_num
    @solution.sol_solution_proposal_date = @conclusion.conc_solution_proposal_date
    @solution.sol_name_product = @conclusion.conc_name_product
    @solution.sol_code_okp = @conclusion.conc_code_okp
    @solution.sol_code_tn_ved = @conclusion.conc_code_tn_ved
    @solution.sol_manuf_name = @conclusion.conc_manuf_name
    @solution.sol_manuf_address = @conclusion.conc_manuf_address
    @solution.sol_manuf_postcode = @conclusion.conc_manuf_postcode
    @solution.sol_manuf_doc = @conclusion.conc_manuf_doc
    @solution.sol_manuf_regulations = @conclusion.conc_manuf_regulations
    @solution.sol_desc_scheme_cert = @conclusion.conc_desc_scheme_cert
    @solution.sol_test_report = @conclusion.conc_test_report
    @solution.sol_list_doc = @conclusion.conc_list_doc
    @solution.sol_conclusion_date = @conclusion.conc_sign_date
    @solution.sol_cert_expiry_date = @conclusion.conc_cert_expiry_date
    @solution.sol_add_info = @conclusion.conc_add_info
    @solution.sol_chief_name = @setting.set_os_chief_position
    @solution.sol_chief_org = @setting.set_os_chief_name
  end

  def create
    @solution = Solution.new(sol_params)
    @solution.save ? (redirect_to @solution) : (render 'new')
  end

  def edit; end

  def update
    @solution.update(sol_params) ? (redirect_to @solution) : (render 'new')
  end

  def destroy
    @solution.destroy
    redirect_to root_path
  end

  private

  def sol_params
    params.require(:solution).permit(:conclusion_id, :sol_number, :sol_date_from, :sol_delivery,
                                     :sol_solution_proposal_num, :sol_solution_proposal_date,
                                     :sol_contract_num, :sol_contract_date, :sol_directive_num,
                                     :sol_directive_date, :sol_name_product, :sol_code_okp,
                                     :sol_code_tn_ved, :sol_manuf_name, :sol_manuf_address,
                                     :sol_manuf_postcode, :sol_manuf_doc, :sol_manuf_regulations,
                                     :sol_desc_scheme_cert, :sol_test_report, :sol_list_doc,
                                     :sol_conclusion_date, :sol_cert_expiry_date, :sol_place_marking,
                                     :sol_inspection_period, :sol_inspection_method, :sol_inspection_work_basis,
                                     :sol_add_info, :sol_chief_name, :sol_chief_org, :sol_expert,
                                     :sol_executor, :sol_applic_sign, :sol_applic_name)
  end

  def sol_find
    @solution = Solution.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
