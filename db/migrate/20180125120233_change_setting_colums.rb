# frozen_string_literal: true

class ChangeSettingColums < ActiveRecord::Migration[5.1]
  def change
    remove_column :settings, :set_org_name
    add_column :settings, :set_org_name, :text
  end
end
