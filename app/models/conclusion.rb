class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates_uniqueness_of :solution_proposal_id
  has_one :solution, dependent: :destroy, inverse_of: :conclusion
end
