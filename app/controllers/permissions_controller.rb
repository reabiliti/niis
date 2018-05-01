# frozen_string_literal: true

class PermissionsController < ApplicationController
  before_action :perm_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]
  before_action :logged_in_user

  def index; end

  def show
    @certificate = Certificate.find(@permission.certificate_id)
    @solution = Solution.find(@certificate.solution_id)
    @conclusion = Conclusion.find(@solution.conclusion_id)
    @solution_proposal = SolutionProposal.find(@conclusion.solution_proposal_id)
    @proposal = Proposal.find(@solution_proposal.proposal_id)
  end

  def new
    @certificate = Certificate.find(params[:certificate_id])
    @solution = Solution.find(@certificate.solution_id)
    @permission = Permission.new
    @permission.certificate_id = @certificate.id
    @permission.perm_place_marking = @solution.sol_place_marking
    @permission.perm_chief_name = @setting.set_os_chief_position
    @permission.perm_chief_org = @setting.set_os_chief_name
  end

  def create
    @permission = Permission.new(permission_params)
    @permission.save ? (redirect_to @permission) : (render 'new')
  end

  def edit; end

  def update
    @permission.update(permission_params) ? (redirect_to @permission) : (render 'new')
  end

  def destroy
    @permission.destroy
    redirect_to root_path
  end

  private

  def permission_params
    params.require(:permission).permit(:certificate_id, :perm_registration_num, :perm_registration_date,
                                       :perm_expiry_date, :perm_place_marking, :perm_chief_name,
                                       :perm_chief_org)
  end

  def perm_find
    @permission = Permission.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
