# frozen_string_literal: true

class CreateCertcontracts < ActiveRecord::Migration[5.1]
  def change
    create_table :certcontracts do |t|
      t.belongs_to :proposal, index: true
      t.string :cecon_exec_chief_name_sign
      t.datetime :cecon_registration_date
      t.string :cecon_registration_num
      t.string :cecon_registration_city
      t.string :cecon_exec_name
      t.string :cecon_exec_named
      t.string :cecon_exec_chief_position
      t.string :cecon_exec_chief_name
      t.string :cecon_exec_active
      t.string :cecon_exec_based_doc
      t.string :cecon_client_name
      t.string :cecon_client_named
      t.string :cecon_client_chief_position
      t.string :cecon_client_chief_name
      t.string :cecon_client_active
      t.string :cecon_client_based_doc
      t.string :cecon_name_product
      t.datetime :cecon_date_from
      t.datetime :cecon_date_expiry
      t.string :cecon_exec_address
      t.string :cecon_exec_bank_details
      t.string :cecon_client_address
      t.string :cecon_client_bank_details
      t.string :cecon_exec_chief_position_sign
      t.string :cecon_exec_chief_name_sign
      t.string :cecon_client_chief_position_sign
      t.string :cecon_client_chief_name_sign

      t.timestamps
    end
  end
end
