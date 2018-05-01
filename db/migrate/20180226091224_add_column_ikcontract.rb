# frozen_string_literal: true

class AddColumnIkcontract < ActiveRecord::Migration[5.1]
  def change
    add_column :ikcontracts, :ikcon_ragistration_city, :string
  end
end
