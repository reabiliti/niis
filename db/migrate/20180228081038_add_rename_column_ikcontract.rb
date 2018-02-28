class AddRenameColumnIkcontract < ActiveRecord::Migration[5.1]
  def change
    rename_column :ikcontracts, :ikcon_exec_chief, :ikcon_exec_chief_position
    rename_column :ikcontracts, :ikcon_client_chief, :ikcon_client_chief_position
    add_column :ikcontracts, :ikcon_exec_chief_name, :string
    add_column :ikcontracts, :ikcon_client_chief_name, :string
  end
end
