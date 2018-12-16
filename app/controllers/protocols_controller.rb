# frozen_string_literal: true

# This controller manage protocols
class ProtocolsController < ApplicationController
  before_action :protocol_find, only: %i[show edit update destroy]

  def show
    @setting = Setting.first
    @solution_proposal = @protocol.solution_proposal
    @proposal = @solution_proposal.proposal
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "protocol_#{@protocol.id}",
               template: 'protocols/show.html.haml'
      end
    end
  end

  def new
    @protocol = Protocol.initialize_object(solution_proposal_params)
  end

  def create
    @protocol = Protocol.new(protocol_params)
    if @protocol.save
      redirect_to @protocol, flash: { success: t('protocols.notices.success.create') }
    else
      flash.now[:danger] = t('protocols.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @protocol.update(protocol_params)
      redirect_to @protocol, flash: { success: t('protocols.notices.success.update') }
    else
      flash.now[:danger] = t('protocols.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @protocol.destroy
    redirect_to root_path, flash: { success: t('protocols.notices.success.destroy') }
  end

  private

  def solution_proposal_params
    solution_proposal = SolutionProposal.find(params[:solution_proposal_id])
    solution_proposal.attributes
                     .merge(solution_proposal_id: solution_proposal.id)
  end

  def protocol_params
    params.require(:protocol).permit(:solution_proposal_id, :date_from, :applic_name_product,
                                     :applic_code_okp, :applic_code_tn_ved, :manuf_name,
                                     :manuf_address, :manuf_postcode, :origin_cert,
                                     :info_product, :date_issue_product, :shelf_life,
                                     :info_box, :label_product, :manuf_regulations,
                                     :evaluation_product, :requirement_test, :list_indicators,
                                     :conclusion, :expert)
  end

  def protocol_find
    @protocol = Protocol.find(params[:id])
  end
end
