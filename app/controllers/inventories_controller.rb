# frozen_string_literal: true

# This controller manage inventories
class InventoriesController < ApplicationController
  before_action :inventory_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

  def show
    @proposal = Proposal.find(@inventory.proposal_id)
  end

  def new
    @inventory = Inventory.initialize_object(proposal_params)
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to @inventory, flash: { success: t('inventories.notices.success.create') }
    else
      flash.now[:danger] = t('inventories.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, flash: { success: t('inventories.notices.success.update') }
    else
      flash.now[:danger] = t('inventories.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @inventory.destroy
    redirect_to root_path, flash: { success: t('inventories.notices.success.destroy') }
  end

  private

  def proposal_params
    proposal = Proposal.find(params[:proposal_id])
    proposal.attributes.merge(proposal_id: proposal.id).merge(@setting.attributes)
  end

  def inventory_params
    params.require(:inventory).permit(:proposal_id, :date_from, :list_doc, :list_page, :exec_name, :os_chief_name)
  end

  def inventory_find
    @inventory = Inventory.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
