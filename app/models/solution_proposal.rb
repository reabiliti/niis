class SolutionProposal < ApplicationRecord
  belongs_to :proposal
  has_one :protocol, dependent: :destroy
  has_one :conclusion, dependent: :destroy
end
