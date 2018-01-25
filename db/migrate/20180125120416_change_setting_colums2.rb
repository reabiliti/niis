class ChangeSettingColums2 < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :set_indent_down, :integer
  end
end
