# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :proposal, index: true
      t.datetime :inv_date_from
      t.string :inv_list_doc
      t.string :inv_list_page
      t.string :inv_exec_name
      t.string :inv_chief_name

      t.timestamps
    end
  end
end
