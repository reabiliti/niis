class AddColumnsCertificates < ActiveRecord::Migration[5.1]
  def change
    add_column :certificates, :cer_code_okp, :string
    add_column :certificates, :cer_code_tn_ved, :string
    add_column :certificates, :cer_regulation, :text
    add_column :certificates, :cer_manufacturer, :text
    add_column :certificates, :cer_certificate_issued, :text
    add_column :certificates, :cer_based, :text
    add_column :certificates, :cer_more_info, :text
    add_column :certificates, :cer_org_chief, :string
    add_column :certificates, :cer_org_expert, :string
  end
end
