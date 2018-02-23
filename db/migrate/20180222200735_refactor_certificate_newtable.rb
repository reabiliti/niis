class RefactorCertificateNewtable < ActiveRecord::Migration[5.1]
  def change
    drop_table :certificates

    create_table :certificates do |t|
      t.belongs_to :solution, index: true
      t.datetime :cert_expiry_date
      t.string :cert_name_product
      t.string :cert_manuf_regulations
      t.string :cert_code_okp
      t.string :cert_code_tn_ved
      t.string :cert_manuf_doc
      t.string :cert_manuf_name
      t.string :cert_manuf_inn
      t.string :cert_manuf_address
      t.string :cert_manuf_postcode
      t.string :cert_test_report
      t.string :cert_add_info
      t.string :cert_place_marking
      t.string :cert_chief_org
      t.string :cert_expert

      t.timestamps
    end
  end
end
