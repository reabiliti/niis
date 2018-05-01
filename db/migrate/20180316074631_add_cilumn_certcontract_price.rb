# frozen_string_literal: true

class AddCilumnCertcontractPrice < ActiveRecord::Migration[5.1]
  def change
    add_column :certcontracts, :cecon_price_work, :string
    add_column :certcontracts, :cecon_price_work_total, :string
  end
end
