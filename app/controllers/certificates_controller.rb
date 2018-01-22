class CertificatesController < ApplicationController

  def new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    @certificate.save
    redirect_to @certificate
  end

  private

    def certificate_params
      params.require(:certificate).permit(:cer_number, :cer_blank_number, 
                                          :cer_validity_from, :cer_validity_to, 
                                          :cer_org_registration))
    end

end
