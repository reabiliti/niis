# frozen_string_literal: true

class AddColumnSettingAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :set_address, :string
  end
end
