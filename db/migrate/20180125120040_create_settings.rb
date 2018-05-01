# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :set_org_name

      t.timestamps
    end
  end
end
