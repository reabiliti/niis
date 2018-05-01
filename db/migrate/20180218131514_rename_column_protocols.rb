# frozen_string_literal: true

class RenameColumnProtocols < ActiveRecord::Migration[5.1]
  def change
    remove_column :protocols, :prot_applic_name
    remove_column :protocols, :prot_applic_address
    remove_column :protocols, :prot_applic_postcode
    add_column :protocols, :prot_manuf_name, :string
    add_column :protocols, :prot_manuf_address, :string
    add_column :protocols, :prot_manuf_postcode, :string
  end
end
