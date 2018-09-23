class ChangeTablesInventoryAndProtocols < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :os_chief_name, :string
    add_column :inventories, :date_from, :datetime
    add_column :inventories, :exec_name, :string
    add_column :inventories, :list_doc, :string
    add_column :inventories, :list_page, :string
    add_foreign_key :inventories, :proposals

    add_column :protocols, :applic_code_okp, :string
    add_column :protocols, :applic_code_tn_ved, :string
    add_column :protocols, :applic_name_product, :text
    add_column :protocols, :conclusion, :string
    add_column :protocols, :date_from, :datetime
    add_column :protocols, :date_issue_product, :datetime
    add_column :protocols, :evaluation_product, :text
    add_column :protocols, :expert, :string
    add_column :protocols, :info_box, :string
    add_column :protocols, :info_product, :string
    add_column :protocols, :label_product, :string
    add_column :protocols, :list_indicators, :text
    add_column :protocols, :manuf_address, :string
    add_column :protocols, :manuf_name, :string
    add_column :protocols, :manuf_postcode, :string
    add_column :protocols, :origin_cert, :string
    add_column :protocols, :manuf_regulations, :string
    add_column :protocols, :requirement_test, :string
    add_column :protocols, :shelf_life, :string
    add_foreign_key :protocols, :solution_proposals

    add_column :conclusions, :add_info, :text
    add_column :conclusions, :attachment, :string
    add_column :conclusions, :cert_expiry_date, :datetime
    add_column :conclusions, :applic_code_okp, :string
    add_column :conclusions, :applic_code_tn_ved, :string
    add_column :conclusions, :conformity, :string
    add_column :conclusions, :desc_scheme_cert, :text
    add_column :conclusions, :expert, :string
    add_column :conclusions, :list_doc_product, :string
    add_column :conclusions, :manuf_address, :string
    add_column :conclusions, :manuf_doc, :string
    add_column :conclusions, :manuf_name, :string
    add_column :conclusions, :manuf_postcode, :string
    add_column :conclusions, :manuf_regulations, :string
    add_column :conclusions, :may_be_issued, :string
    add_column :conclusions, :applic_name_product, :text
    add_column :conclusions, :sign_date, :datetime
    add_column :conclusions, :date_from, :datetime
    add_column :conclusions, :number, :string
    add_column :conclusions, :test_report, :text
  end
end
