# frozen_string_literal: true

class AddColumnCertificateApplic < ActiveRecord::Migration[5.1]
  def change
    add_column :certificates, :cert_applic_name, :string
    add_column :certificates, :cert_applic_inn, :string
    add_column :certificates, :cert_applic_address, :string
    add_column :certificates, :cert_applic_postcode, :string
    add_column :certificates, :cert_applic_phone, :string
  end
end
