class CertificatesController < ApplicationController
  before_action :certificate_find, only: [:show, :edit, :update, :destroy]
  before_action :setting_all, only: [:new, :edit, :update, :create]

  def index
    @certificates = Certificate.search(params[:cer_search])
  end

  def show
    @setting = setting_find unless @certificate.setting_id.nil?
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@certificate, @setting)
        send_data pdf.render,
                  filename: "order_#{@certificate.cer_number}",
                  type: 'application/pdf',
                  disposition: 'inline',
                  page_layout: 'landscape'
      end
    end
  end

  def new
    @certificate = Certificate.new
  end

  def edit
  end

  def create
    @certificate = Certificate.new(certificate_params)
    @certificate.save ? (redirect_to @certificate) : (render 'new')
  end

  def update
    @certificate.update(certificate_params) ? (redirect_to @certificate) : (render 'edit')
  end

  def destroy
    @certificate.destroy
    redirect_to certificates_path
  end

  def self.search(cer_search)
    cer_search ? (where('cer_number LIKE ? OR cer_blank_number LIKE ?', "%#{params[:cer_search]}%", "%#{params[:cer_search]}%")) : all
  end

  private

    def certificate_params
      params.require(:certificate).permit(:cer_number, :cer_blank_number,
                                          :cer_validity_from, :cer_validity_to,
                                          :cer_product_name, :cer_code_okp,
                                          :cer_code_tn_ved,
                                          :cer_regulation, :cer_manufacturer,
                                          :cer_certificate_issued,
                                          :cer_based, :cer_more_info,
                                          :cer_org_chief, :cer_org_expert,
                                          :setting_id, :cer_search)
    end

    def certificate_find
      @certificate = Certificate.find(params[:id])
    end

    def setting_find
      Setting.find(@certificate.setting_id)
    end

    def setting_all
      @settings = Setting.all
    end

end
