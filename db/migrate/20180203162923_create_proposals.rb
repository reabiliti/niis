# frozen_string_literal: true

class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :prop_number
      t.datetime :prop_date_from
      t.string :prop_cert_system
      t.string :prop_applic_name
      t.string :prop_applic_reg_doc
      t.string :prop_applic_address
      t.string :prop_applic_postcode
      t.text :prop_applic_bank_detail
      t.string :prop_applic_phone
      t.string :prop_applic_fax
      t.string :prop_applic_email
      t.string :prop_applic_code_okato
      t.string :prop_applic_type_own
      t.string :prop_applic_code_okonh
      t.string :prop_applic_code_okved
      t.string :prop_applic_code_okpo
      t.integer :prop_applic_inn
      t.integer :prop_applic_kpp
      t.string :prop_applic_chief
      t.text :prop_applic_name_product
      t.integer :prop_applic_code_okp
      t.integer :prop_applic_code_tn_ved
      t.string :prop_applic_from_issue
      t.string :prop_manuf_name
      t.string :prop_manuf_address
      t.integer :prop_manuf_postcode
      t.string :prop_manuf_doc
      t.string :prop_manuf_code_okato
      t.string :prop_manuf_type_own
      t.string :prop_manuf_code_okonh
      t.string :prop_manuf_code_okved
      t.string :prop_manuf_code_okpo
      t.integer :prop_manuf_inn
      t.string :prop_manuf_regulations
      t.integer :prop_manuf_scheme_cert
      t.integer :prop_manuf_count_sort_cert
      t.integer :prop_manuf_group_complexity
      t.text :prop_manuf_list_doc
      t.text :prop_manuf_add_info
      t.string :prop_manuf_chief_org
      t.string :prop_manuf_chief_accountant

      t.timestamps
    end
  end
end
