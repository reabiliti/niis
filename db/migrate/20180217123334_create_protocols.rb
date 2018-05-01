# frozen_string_literal: true

class CreateProtocols < ActiveRecord::Migration[5.1]
  def change
    create_table :protocols do |t|
      t.belongs_to :solution_proposal, index: true
      t.datetime :prot_date_from
      t.text :prot_applic_name_product
      t.string :prot_applic_code_okp
      t.string :prot_applic_code_tn_ved
      t.string :prot_applic_name
      t.string :prot_applic_address
      t.string :prot_applic_postcode
      t.string :prot_origin_cert
      t.string :prot_info_product
      t.datetime :prot_date_issue_product
      t.string :prot_shelf_life
      t.string :prot_info_box
      t.string :prot_label_product
      t.string :prot_regulations_product
      t.text :prot_evaluation_product
      t.string :prot_requirement_test
      t.text :prot_list_indicators
      t.string :prot_conclusion
      t.string :prot_expert

      t.timestamps
    end
  end
end
