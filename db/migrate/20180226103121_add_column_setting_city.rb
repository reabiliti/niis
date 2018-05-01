# frozen_string_literal: true

class AddColumnSettingCity < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :set_os_city, :string
  end
end
