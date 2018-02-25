class ChangeIkContractBankDetails < ActiveRecord::Migration[5.1]
  def change
    rename_column :ikcontracts, :ikcon_client_bank_detail, :ikcon_client_bank_details
  end
end
