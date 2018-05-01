# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.belongs_to :certificate, index: true
      t.string :perm_registration_num
      t.datetime :perm_registration_date
      t.datetime :perm_expiry_date
      t.string :perm_place_marking
      t.string :perm_chief_name
      t.string :perm_chief_org

      t.timestamps
    end
  end
end
