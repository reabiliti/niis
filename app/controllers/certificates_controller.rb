class CertificatesController < ApplicationController

  def index
    @certificates = Certificate.all
  end

  def show
    @certificate = certificate_find
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@certificate)
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
    @certificate = certificate_find
  end

  def create
    @certificate = Certificate.new(certificate_params)
    @certificate.save ? (redirect_to @certificate) : (render 'new')
  end

  def update
    @certificate = certificate_find
    @certificate.update(certificate_params) ? (redirect_to @certificate) : (render 'edit')
  end

  def destroy
    @certificate = certificate_find
    @certificate.destroy
    redirect_to certificates_path
  end

  private

    def certificate_params
      params.require(:certificate).permit(:cer_number, :cer_blank_number,
                                          :cer_validity_from, :cer_validity_to,
                                          :cer_org_registration, :cer_product_name,
                                          :cer_code_okp, :cer_code_tn_ved,
                                          :cer_regulation, :cer_manufacturer,
                                          :cer_certificate_issued,
                                          :cer_based, :cer_more_info,
                                          :cer_org_chief, :cer_org_expert)
    end

    def certificate_find
      Certificate.find(params[:id])
    end

end
