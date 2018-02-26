class SolutionProposal < ApplicationRecord
  belongs_to :proposal, inverse_of: :solution_proposal
  validates_uniqueness_of :proposal_id
  has_one :protocol, dependent: :destroy, inverse_of: :solution_proposal
  has_one :conclusion, dependent: :destroy, inverse_of: :solution_proposal
end
