# frozen_string_literal: true

class SolutionProposal < ApplicationRecord
  belongs_to :proposal, inverse_of: :solution_proposal
  validates :proposal_id, uniqueness: true
  validates :solprop_number, :solprop_date_from, presence: true
  has_many :protocols, dependent: :destroy, inverse_of: :solution_proposal
  has_one :conclusion, dependent: :destroy, inverse_of: :solution_proposal
end
