class AddColumnSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :set_os_registration_num, :string
    add_column :settings, :set_os_registration_date, :datetime
    add_column :settings, :set_os_name, :string
    add_column :settings, :set_os_address, :string
    add_column :settings, :set_os_chief_position, :string
    add_column :settings, :set_os_chief_name, :string
    add_column :settings, :set_os_based_doc, :string
    add_column :settings, :set_org_name, :string
    add_column :settings, :set_org_address, :string
    add_column :settings, :set_org_phone, :string
    add_column :settings, :set_org_chief_position, :string
    add_column :settings, :set_org_chief_name, :string
    add_column :settings, :set_org_based_doc, :string
    add_column :settings, :set_org_chief_accountant, :string
    remove_column :settings, :set_organization
    remove_column :settings, :set_address
  end
end
