class Protocol < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :protocol
  validates :solution_proposal_id, uniqueness: true
end
