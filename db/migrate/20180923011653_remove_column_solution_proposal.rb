class RemoveColumnSolutionProposal < ActiveRecord::Migration[5.2]
  def change
    safety_assured { remove_column :solution_proposals, :solution, :string }
  end
end
