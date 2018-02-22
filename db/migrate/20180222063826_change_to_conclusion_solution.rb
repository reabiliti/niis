class ChangeToConclusionSolution < ActiveRecord::Migration[5.1]
  def change
    rename_column :conclusions, :conc_solution_num, :conc_solution_proposal_num
    rename_column :conclusions, :conc_solution_date, :conc_solution_proposal_date
  end
end
