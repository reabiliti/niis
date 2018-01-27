class AddAssotoationSetting < ActiveRecord::Migration[5.1]
  def change
    remove_column :certificates, :setting_id
    remove_column :certificates, :cer_org_registration
    add_reference :certificates, :setting, foreign_key: true


  end
end
