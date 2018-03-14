class Solution < ApplicationRecord
  belongs_to :conclusion, inverse_of: :solution
  validates :conclusion_id, uniqueness: true
  validates :sol_number, :sol_date_from, :sol_solution_proposal_date,
            :sol_solution_proposal_num, :sol_cert_expiry_date,
            :sol_conclusion_date, presence: true

  has_many :certificates, dependent: :destroy, inverse_of: :solution
end
