# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :inventory_find, only: %i[show edit update destroy]
  before_action :setting_find, only: %i[show new]

  def show
    @proposal = Proposal.find(@inventory.proposal_id)
  end

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @inventory = Inventory.new
    @inventory.proposal_id = @proposal.id
    @inventory.inv_chief_name = @setting.os_chief_name
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
      render :new
    end
  end

  def destroy
    @inventory.destroy
    redirect_to root_path, flash: { success: t('inventories.notices.success.destroy') }
  end

  private

  def inventory_params
    params.require(:inventory).permit(:proposal_id, :inv_date_from, :inv_list_doc,
                                      :inv_list_page, :inv_exec_name, :inv_chief_name)
  end

  def inventory_find
    @inventory = Inventory.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
