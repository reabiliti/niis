class Protocol < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :protocol
  validates_uniqueness_of :solution_proposal_id
end
