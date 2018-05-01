# frozen_string_literal: true

class DelColumsContractDirective < ActiveRecord::Migration[5.1]
  def change
    remove_column :conclusions, :conc_contract_num
    remove_column :conclusions, :conc_contract_date
    remove_column :conclusions, :conc_directive_num
    remove_column :conclusions, :conc_directive_date
    remove_column :solutions, :sol_contract_num
    remove_column :solutions, :sol_contract_date
    remove_column :solutions, :sol_directive_num
    remove_column :solutions, :sol_directive_date
  end
end
