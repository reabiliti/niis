# frozen_string_literal: true

class ChangeIntToStrProposalTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :proposals, :prop_applic_postcode
    remove_column :proposals, :prop_applic_inn
    remove_column :proposals, :prop_applic_kpp
    remove_column :proposals, :prop_applic_code_okp
    remove_column :proposals, :prop_applic_code_tn_ved
    remove_column :proposals, :prop_manuf_postcode
    remove_column :proposals, :prop_manuf_inn
    remove_column :proposals, :prop_manuf_scheme_cert
    remove_column :proposals, :prop_manuf_count_sort_cert
    remove_column :proposals, :prop_manuf_group_complexity

    add_column :proposals, :prop_applic_postcode, :string
    add_column :proposals, :prop_applic_inn, :string
    add_column :proposals, :prop_applic_kpp, :string
    add_column :proposals, :prop_applic_code_okp, :string
    add_column :proposals, :prop_applic_code_tn_ved, :string
    add_column :proposals, :prop_manuf_postcode, :string
    add_column :proposals, :prop_manuf_inn, :string
    add_column :proposals, :prop_manuf_scheme_cert, :string
    add_column :proposals, :prop_manuf_count_sort_cert, :string
    add_column :proposals, :prop_manuf_group_complexity, :string
  end
end
