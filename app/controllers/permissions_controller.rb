# frozen_string_literal: true

class PermissionsController < ApplicationController
  before_action :permission_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

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
    @permission.perm_chief_name = @setting.os_chief_position
    @permission.perm_chief_org = @setting.os_chief_name
  end

  def create
    @permission = Permission.new(permission_params)
    if @permission.save
      redirect_to @permission, flash: { success: t('permissions.notices.success.create') }
    else
      flash.now[:danger] = t('permissions.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @permission.update(permission_params)
      redirect_to @permission, flash: { success: t('permissions.notices.success.update') }
    else
      flash.now[:danger] = t('permissions.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @permission.destroy
    redirect_to root_path, flash: { success: t('permissions.notices.success.destroy') }
  end

  private

  def permission_params
    params.require(:permission).permit(:certificate_id, :perm_registration_num, :perm_registration_date,
                                       :perm_expiry_date, :perm_place_marking, :perm_chief_name,
                                       :perm_chief_org)
  end

  def permission_find
    @permission = Permission.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
