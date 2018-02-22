class ChangeRenameColumnConclusions < ActiveRecord::Migration[5.1]
  def change
    change_column :solution_proposals, :solprop_applic_sign, :boolean, null: false
    rename_column :conclusions, :conc_expiry_date, :conc_cert_expiry_date
    change_column :solutions, :sol_date_from, :datetime
  end
end
