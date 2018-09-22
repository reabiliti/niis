class ChangeColumnsCertcontracts < ActiveRecord::Migration[5.2]
  def change
    add_column :certcontracts, :org_chief_name_sign, :string
    add_column :certcontracts, :registration_date, :datetime
    add_column :certcontracts, :registration_num, :string
    add_column :certcontracts, :os_city, :string
    add_column :certcontracts, :org_name, :string
    add_column :certcontracts, :org_named, :string
    add_column :certcontracts, :org_chief_position, :string
    add_column :certcontracts, :org_chief_name, :string
    add_column :certcontracts, :org_active, :string
    add_column :certcontracts, :org_based_doc, :string
    add_column :certcontracts, :applic_name, :string
    add_column :certcontracts, :applic_named, :string
    add_column :certcontracts, :applic_chief_position, :string
    add_column :certcontracts, :applic_chief_name, :string
    add_column :certcontracts, :applic_active, :string
    add_column :certcontracts, :applic_based_doc, :string
    add_column :certcontracts, :applic_name_product, :string
    add_column :certcontracts, :date_from, :datetime
    add_column :certcontracts, :date_expiry, :datetime
    add_column :certcontracts, :org_address, :string
    add_column :certcontracts, :org_postcode, :string
    add_column :certcontracts, :org_bank_details, :string
    add_column :certcontracts, :applic_address, :string
    add_column :certcontracts, :applic_postcode, :string
    add_column :certcontracts, :applic_bank_details, :string
    add_column :certcontracts, :org_chief_position_sign, :string
    add_column :certcontracts, :applic_chief_position_sign, :string
    add_column :certcontracts, :applic_chief_name_sign, :string
    add_column :certcontracts, :price_work, :string
    add_column :certcontracts, :price_work_total, :string

    add_column :settings, :os_postcode, :string
    add_column :settings, :org_postcode, :string
    add_column :proposals, :applic_chief_position, :string
    add_column :proposals, :applic_chief_name, :string
    add_column :proposals, :manuf_chief_position, :string
    add_column :proposals, :manuf_chief_name, :string

    add_foreign_key :certcontracts, :proposals
  end
end
