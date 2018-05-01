# frozen_string_literal: true

class AddSettingAtXyColums < ActiveRecord::Migration[5.1]
  def change
    remove_column :settings, :set_indent_down
    add_column :settings, :set_at_x, :integer
    add_column :settings, :set_at_y, :integer
  end
end
