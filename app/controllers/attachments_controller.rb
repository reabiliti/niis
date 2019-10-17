# frozen_string_literal: true

# This class to attachments certificates
class AttachmentsController < ApplicationController
  before_action :attachment_find, only: %i[show edit update destroy]
  before_action :setting_find, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.pdf do
        certificate = @attachment.certificate
        pdf = AttachmentPdf.new(@attachment, @setting, certificate)
        send_data pdf.render, filename: "attachment_#{certificate.cert_registration_num}",
                              type: 'application/pdf',
                              disposition: 'inline',
                              page_layout: 'landscape'
      end
    end
  end

  def new
    @certificate = Certificate.find(params[:certificate_id])
    @attachment = Attachment.new
    @attachment.certificate_id = @certificate.id
    @attachment.att_code_okp = @certificate.cert_code_okp
    @attachment.att_code_tn_ved = @certificate.cert_code_tn_ved
    @attachment.att_name_product = @certificate.cert_name_product
    @attachment.att_manuf_name = @certificate.cert_manuf_name
    @attachment.att_regulations = @certificate.cert_manuf_doc
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to @attachment, flash: { success: t('attachments.notices.success.create') }
    else
      flash.now[:danger] = t('attachments.notices.danger.create')
      render :new
    end
  end

  def edit; end

  def update
    if @attachment.update(attachment_params)
      redirect_to @attachment, flash: { success: t('attachments.notices.success.update') }
    else
      flash.now[:danger] = t('attachments.notices.danger.update')
      render :edit
    end
  end

  def destroy
    @attachment.destroy
    redirect_to root_path, flash: { success: t('attachments.notices.success.destroy') }
  end

  private

  def attachment_params
    params.require(:attachment).permit(:certificate_id, :att_blank_num,
                                       :att_code_okp, :att_code_tn_ved,
                                       :att_name_product, :att_manuf_name,
                                       :att_regulations)
  end

  def attachment_find
    @attachment = Attachment.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
