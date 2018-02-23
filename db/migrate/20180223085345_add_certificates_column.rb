class AddCertificatesColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :certificates, :cert_registration_date, :datetime
    add_column :certificates, :cert_registration_num, :string
    add_column :certificates, :cert_blank_num, :string
  end
end
