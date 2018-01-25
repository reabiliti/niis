class AddAssotiationToSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :certificates, :setting_id, :integer
    add_index :certificates, :setting_id
    add_index :certificates, :id
    add_foreign_key :certificates, :settings

  end
end
