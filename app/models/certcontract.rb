class Certcontract < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
end
