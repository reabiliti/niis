class ChangeUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :users

    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :name, null: false
      t.datetime :remember_me_token_expires_at
      t.string :remember_me_token
      t.string :salt, null: false
      t.string :crypted_password, null: false
      t.string :role, null: false

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
