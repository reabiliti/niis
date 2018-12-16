# frozen_string_literal: true

# This query for rendering root with childrens
class AllProposalsQuery
  def call
    Proposal.includes(
      :certcontract,
      :inventory,
      solution_proposal: [
        :protocols,
        conclusion: [
          solution: [
            certificates: %i[
              permission
              ikcontract
              attachments
            ]
          ]
        ]
      ]
    ).all
  end
end
