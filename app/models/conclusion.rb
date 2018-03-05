class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates :solution_proposal_id, uniqueness: true
  validates :conc_solution_proposal_num, :conc_solution_proposal_date, :conc_contract_num,
            :conc_contract_date, :conc_directive_num, :conc_directive_date,
            :conc_cert_expiry_date, :conc_sign_date, presence: true

  has_one :solution, dependent: :destroy, inverse_of: :conclusion
end
