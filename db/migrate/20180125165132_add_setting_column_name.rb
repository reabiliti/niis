# frozen_string_literal: true

class AddSettingColumnName < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :set_name, :string
    add_column :settings, :set_organization, :text
    remove_column :settings, :set_org_name
  end
end
