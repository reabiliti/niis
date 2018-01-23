class CertificatesController < ApplicationController

  def index
    @certificates = Certificate.all
  end

  def show
    @certificate = certificate_find
  end

  def new
    @certificate = Certificate.new
  end

  def edit
    @certificate = certificate_find
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to @certificate
    else
      render 'new'
    end
  end

  def update
    @certificate = certificate_find
    if @certificate.update(certificate_params)
      redirect_to @certificate
    else
      render 'edit'
    end
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
                                          :cer_org_registration)
    end

    def certificate_find
      Certificate.find(params[:id])
    end

end
