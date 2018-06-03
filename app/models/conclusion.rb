# frozen_string_literal: true

# Model conclusions
class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates :solution_proposal_id, uniqueness: true
  validates :conc_solution_proposal_num, :conc_solution_proposal_date,
            :conc_cert_expiry_date, :conc_sign_date, presence: true

  has_one :solution, dependent: :destroy, inverse_of: :conclusion

  MAY_BE_ISSUE = %w[может не\ может].freeze
end
