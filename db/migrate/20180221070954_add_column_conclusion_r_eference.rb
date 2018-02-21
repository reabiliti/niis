class AddColumnConclusionREference < ActiveRecord::Migration[5.1]
  def change
    add_reference :conclusions, :solution_proposal, foreign_key: true
  end
end
