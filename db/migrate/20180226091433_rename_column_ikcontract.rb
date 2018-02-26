class RenameColumnIkcontract < ActiveRecord::Migration[5.1]
  def change
    rename_column :ikcontracts, :ikcon_ragistration_city, :ikcon_registration_city
  end
end
