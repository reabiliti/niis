class InventoriesController < ApplicationController
  before_action :inv_find, only: [:show, :edit, :update, :destroy]
  before_action :setting_find, only: [:show, :new]
  def index
  end

  def show
    @proposal = Proposal.find(@inventory.proposal_id)
  end

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @inventory = Inventory.new
    @inventory.proposal_id = @proposal.id
    @inventory.inv_chief_name = @setting.set_os_chief_name
  end

  def create
    @inventory = Inventory.new(inv_params)
    @inventory.save ? (redirect_to @inventory) : (render 'new')
  end

  def edit
  end

  def update
    @inventory.update(inv_params) ? (redirect_to @inventory) : (render 'new')
  end

  def destroy
    @inventory.destroy
    redirect_to root_path
  end

  private
  def inv_params
    params.require(:inventory).permit(:proposal_id, :inv_date_from, :inv_list_doc,
                                      :inv_list_page, :inv_exec_name, :inv_chief_name)
  end

  def inv_find
    @inventory = Inventory.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end

end
