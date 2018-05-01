# frozen_string_literal: true

class CreateIkcontracts < ActiveRecord::Migration[5.1]
  def change
    create_table :ikcontracts do |t|
      t.belongs_to :certificate, index: true
      t.datetime :ikcon_registration_date
      t.string :ikcon_registration_num
      t.string :ikcon_exec_name
      t.string :ikcon_exec_named
      t.string :ikcon_exec_chief
      t.string :ikcon_exec_active
      t.string :ikcon_exec_based_doc
      t.string :ikcon_client_name
      t.string :ikcon_client_named
      t.string :ikcon_client_chief
      t.string :ikcon_client_active
      t.string :ikcon_client_based_doc
      t.string :ikcon_name_product
      t.string :ikcon_cert_registration_num
      t.string :ikcon_inspection_period
      t.string :ikcon_contract_time
      t.string :ikcon_exec_address
      t.string :ikcon_exec_bank_details
      t.string :ikcon_client_address
      t.string :ikcon_client_bank_detail

      t.timestamps
    end
  end
end
