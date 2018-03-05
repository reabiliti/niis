class Protocol < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :protocols
  validates :prot_date_from, :prot_date_issue_product, presence: true
end
