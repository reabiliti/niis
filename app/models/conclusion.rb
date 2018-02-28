class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates :solution_proposal_id, uniqueness: true
  has_one :solution, dependent: :destroy, inverse_of: :conclusion
end
