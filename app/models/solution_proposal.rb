class SolutionProposal < ApplicationRecord
  belongs_to :proposal, inverse_of: :solution_proposal
  validates :proposal_id, uniqueness: true
  has_many :protocols, dependent: :destroy, inverse_of: :solution_proposal
  has_one :conclusion, dependent: :destroy, inverse_of: :solution_proposal
end
