# frozen_string_literal: true

class CreateSolutionProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :solution_proposals do |t|
      t.belongs_to :proposal, index: true
      t.string :solprop_number
      t.datetime :solprop_date_from
      t.string :solprop_solution
      t.text :solprop_applic_name_product
      t.string :solprop_applic_code_okp
      t.string :solprop_applic_code_tn_ved
      t.string :solprop_manuf_name
      t.string :solprop_manuf_address
      t.string :solprop_manuf_postcode
      t.string :solprop_manuf_doc
      t.string :solprop_manuf_list_doc
      t.string :solprop_regulations
      t.string :solprop_desc_scheme_cert
      t.string :solprop_test_lab
      t.string :solprop_sampling
      t.string :solprop_list_doc_product
      t.string :solprop_basis_work
      t.string :solprop_add_info
      t.string :solprop_chief_name
      t.string :solprop_chief_org
      t.string :solprop_expert
      t.string :solprop_executor
      t.boolean :solprop_applic_sign
      t.string :solprop_applic_name

      t.timestamps
    end
  end
end
