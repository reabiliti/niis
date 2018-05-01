# frozen_string_literal: true

class ChangeColumsSolutionProposals < ActiveRecord::Migration[5.1]
  def change
    remove_column :solution_proposals, :solprop_manuf_name
    remove_column :solution_proposals, :solprop_manuf_list_doc
    add_column :solution_proposals, :solprop_manuf_name, :text
    add_column :solution_proposals, :solprop_manuf_list_doc, :text
  end
end
