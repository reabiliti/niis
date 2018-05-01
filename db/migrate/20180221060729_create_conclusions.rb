# frozen_string_literal: true

class CreateConclusions < ActiveRecord::Migration[5.1]
  def change
    create_table :conclusions do |t|
      t.string :conc_solution_num
      t.datetime :conc_solution_date
      t.string :conc_contract_num
      t.datetime :conc_contract_date
      t.string :conc_directive_num
      t.datetime :conc_directive_date
      t.text :conc_name_product
      t.string :conc_code_okp
      t.string :conc_tn_ved
      t.string :conc_manuf_name
      t.string :conc_manuf_address
      t.string :conc_manuf_postcode
      t.string :conc_manuf_doc
      t.string :conc_manuf_regulations
      t.string :conc_desc_scheme_cert
      t.text :conc_test_report
      t.string :conc_list_doc
      t.string :conc_conformity
      t.string :conc_may_be_issued
      t.datetime :conc_expiry_date
      t.text :conc_add_info
      t.string :conc_attachment
      t.string :conc_expert
      t.datetime :conc_sign_date

      t.timestamps
    end
  end
end
