class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.belongs_to :conclusion, index: true
      t.string :sol_number
      t.string :sol_date_from
      t.string :sol_delivery
      t.string :sol_solution_proposal_num
      t.datetime :sol_solution_proposal_date
      t.string :sol_contract_num
      t.datetime :sol_contract_date
      t.string :sol_directive_num
      t.datetime :sol_directive_date
      t.text :sol_name_product
      t.string :sol_code_okp
      t.string :sol_code_tn_ved
      t.string :sol_manuf_name
      t.string :sol_manuf_address
      t.string :sol_manuf_postcode
      t.string :sol_manuf_doc
      t.string :sol_manuf_regulations
      t.text :sol_desc_scheme_cert
      t.text :sol_test_report
      t.string :sol_list_doc
      t.datetime :sol_conclusion_date
      t.datetime :sol_cert_expiry_date
      t.string :sol_place_marking
      t.string :sol_inspection_period
      t.string :sol_inspection_method
      t.string :sol_inspection_work_basis
      t.text :sol_add_info
      t.string :sol_chief_name
      t.string :sol_chief_org
      t.string :sol_expert
      t.string :sol_executor
      t.boolean :sol_applic_sign, default: false, null: false
      t.string :sol_applic_name

      t.timestamps
    end
  end
end
