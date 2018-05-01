# frozen_string_literal: true

class AddColumnIkcontractChief < ActiveRecord::Migration[5.1]
  def change
    add_column :ikcontracts, :ikcon_exec_chief_position_sign, :string
    add_column :ikcontracts, :ikcon_exec_chief_name_sign, :string
    add_column :ikcontracts, :ikcon_client_chief_position_sign, :string
    add_column :ikcontracts, :ikcon_client_chief_name_sign, :string
  end
end
