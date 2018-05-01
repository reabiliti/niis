class AttachmentsController < ApplicationController
  before_action :attach_find, only: [:show, :edit, :update, :destroy]
  before_action :setting_find, only: [:show]
  before_action :logged_in_user

  def index; end

  def show
    @certificate = Certificate.find(@attachment.certificate_id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AttachmentPdf.new(@attachment, @setting, @certificate)
        send_data pdf.render,
                  filename: "attachment_#{@certificate.cert_registration_num}",
                  type: 'application/pdf', disposition: 'inline',
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
    @attachment = Attachment.new(attach_params)
    @attachment.save ? (redirect_to @attachment) : (render 'new')
  end

  def edit
    @certificate = Certificate.find(@attachment.certificate_id)
  end

  def update
    @attachment.update(attach_params) ? (redirect_to @attachment) : (render 'new')
  end

  def destroy
    @attachment.destroy
    redirect_to root_path
  end

  private

  def attach_params
    params.require(:attachment).permit(:certificate_id, :att_blank_num,
                                       :att_code_okp, :att_code_tn_ved,
                                       :att_name_product, :att_manuf_name,
                                       :att_regulations)
  end

  def attach_find
    @attachment = Attachment.find(params[:id])
  end

  def setting_find
    @setting = Setting.first
  end
end
