# frozen_string_literal: true

class ProposalsQuery
  def call
    Proposal.includes(
      :certcontract,
      :inventory,
      solution_proposal: [
        :protocols,
        conclusion: [
          solution: [
            certificates: [
              :permission,
              :ikcontract,
              :attachments
            ]
          ]
        ]
      ]
    )
  end
end
