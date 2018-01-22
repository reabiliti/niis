class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.string :cer_number
      t.string :cer_blank_number
      t.datetime :cer_validity_from
      t.datetime :cer_validity_to
      t.string :cer_org_registration
      t.string :cer_product_name

      t.timestamps
    end
  end
end
