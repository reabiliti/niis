class DataCopySolutionProposalNewColumn < ActiveRecord::Migration[5.2]
  def change
    SolutionProposal.all.each do |solution_proposal|
      solution_proposal.update!(
        decision_was_made: solution_proposal.solution
      )
    end
  end
end
