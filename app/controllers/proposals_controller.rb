# frozen_string_literal: true

# This controller manage proposals
class ProposalsController < ApplicationController
  before_action :proposal_find, only: %i[show edit update destroy]

  def index; end

  def show
    @setting = Setting.first
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to @proposal, flash: { success: t('proposals.notices.success.create') }
    else
      flash.now[:danger] = t('proposals.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, flash: { success: t('proposals.notices.success.update') }
    else
      flash.now[:danger] = t('proposals.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to root_path, flash: { success: t('proposals.notices.success.destroy') }
  end

  private

  def proposal_params
    params.require(:proposal).permit!
  end

  def proposal_find
    @proposal = Proposal.find(params[:id])
  end
end
